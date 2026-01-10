// Settings page.

import 'package:flutter/material.dart';

import '../../core/constants/app_constants.dart';
import '../../core/theme/app_theme.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        padding: const EdgeInsets.all(AppConstants.paddingMD),
        children: [
          _buildSection(
            context,
            title: 'About',
            children: [
              _buildTile(
                context,
                icon: Icons.info_outline,
                title: AppConstants.appName,
                subtitle: 'Version ${AppConstants.appVersion}',
              ),
              _buildTile(
                context,
                icon: Icons.description_outlined,
                title: 'Open Source Licenses',
                onTap: () => showLicensePage(
                  context: context,
                  applicationName: AppConstants.appName,
                  applicationVersion: AppConstants.appVersion,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppConstants.paddingMD),
          _buildSection(
            context,
            title: 'Reading',
            children: [
              _buildTile(
                context,
                icon: Icons.text_fields,
                title: 'Font Size',
                subtitle: 'Medium',
                onTap: () {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(const SnackBar(content: Text('Coming soon!')));
                },
              ),
              _buildTile(
                context,
                icon: Icons.dark_mode_outlined,
                title: 'Theme',
                subtitle: 'System',
                onTap: () {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(const SnackBar(content: Text('Coming soon!')));
                },
              ),
            ],
          ),
          const SizedBox(height: AppConstants.paddingMD),
          _buildSection(
            context,
            title: 'Storage',
            children: [
              _buildTile(
                context,
                icon: Icons.folder_outlined,
                title: 'Downloaded Files',
                subtitle: 'Manage your downloads',
                onTap: () {},
              ),
              _buildTile(
                context,
                icon: Icons.delete_outline,
                title: 'Clear Cache',
                subtitle: 'Free up space',
                onTap: () => _confirmClearCache(context),
              ),
            ],
          ),
          const SizedBox(height: AppConstants.paddingXL),
          Center(
            child: Column(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    gradient: AppColors.primaryGradient,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Icon(
                    Icons.auto_stories,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
                const SizedBox(height: 12),
                Text(AppConstants.appName, style: theme.textTheme.titleMedium),
                const SizedBox(height: 4),
                Text(
                  'Your unified content hub',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: AppColors.textSecondaryLight,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(
    BuildContext context, {
    required String title,
    required List<Widget> children,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: AppConstants.paddingSM,
            bottom: AppConstants.paddingSM,
          ),
          child: Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.labelLarge?.copyWith(color: AppColors.primary),
          ),
        ),
        Card(child: Column(children: children)),
      ],
    );
  }

  Widget _buildTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    String? subtitle,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: AppColors.primary),
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle) : null,
      trailing: onTap != null
          ? const Icon(Icons.chevron_right, color: AppColors.textSecondaryLight)
          : null,
      onTap: onTap,
    );
  }

  void _confirmClearCache(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Clear Cache'),
        content: const Text(
          'This will clear cached news articles. Downloaded books will not be affected.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('Cache cleared!')));
            },
            child: const Text('Clear'),
          ),
        ],
      ),
    );
  }
}

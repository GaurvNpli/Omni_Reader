// Hive model for downloaded files.

import 'package:hive_flutter/hive_flutter.dart';

part 'downloaded_file_hive.g.dart';

@HiveType(typeId: 0)
class DownloadedFileHive extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String localPath;

  @HiveField(3)
  final DateTime downloadedAt;

  @HiveField(4)
  final int fileSizeBytes;

  @HiveField(5)
  final String? thumbnailUrl;

  @HiveField(6)
  final String? author;

  @HiveField(7)
  final String fileType;

  @HiveField(8)
  final String downloadUrl;

  @HiveField(9)
  int? lastReadPosition;

  @HiveField(10)
  DateTime? lastOpenedAt;

  @HiveField(11)
  final String? description;

  DownloadedFileHive({
    required this.id,
    required this.title,
    required this.localPath,
    required this.downloadedAt,
    required this.fileSizeBytes,
    this.thumbnailUrl,
    this.author,
    required this.fileType,
    required this.downloadUrl,
    this.lastReadPosition,
    this.lastOpenedAt,
    this.description,
  });
}

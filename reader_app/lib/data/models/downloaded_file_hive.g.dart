// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'downloaded_file_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DownloadedFileHiveAdapter extends TypeAdapter<DownloadedFileHive> {
  @override
  final int typeId = 0;

  @override
  DownloadedFileHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DownloadedFileHive(
      id: fields[0] as String,
      title: fields[1] as String,
      localPath: fields[2] as String,
      downloadedAt: fields[3] as DateTime,
      fileSizeBytes: fields[4] as int,
      thumbnailUrl: fields[5] as String?,
      author: fields[6] as String?,
      fileType: fields[7] as String,
      downloadUrl: fields[8] as String,
      lastReadPosition: fields[9] as int?,
      lastOpenedAt: fields[10] as DateTime?,
      description: fields[11] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, DownloadedFileHive obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.localPath)
      ..writeByte(3)
      ..write(obj.downloadedAt)
      ..writeByte(4)
      ..write(obj.fileSizeBytes)
      ..writeByte(5)
      ..write(obj.thumbnailUrl)
      ..writeByte(6)
      ..write(obj.author)
      ..writeByte(7)
      ..write(obj.fileType)
      ..writeByte(8)
      ..write(obj.downloadUrl)
      ..writeByte(9)
      ..write(obj.lastReadPosition)
      ..writeByte(10)
      ..write(obj.lastOpenedAt)
      ..writeByte(11)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DownloadedFileHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cache_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CacheResponseAdapter extends TypeAdapter<CacheResponse> {
  @override
  final int typeId = 1;

  @override
  CacheResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CacheResponse(
      response: (fields[0] as Map?)?.cast<String, dynamic>(),
      etag: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CacheResponse obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.response)
      ..writeByte(1)
      ..write(obj.etag);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CacheResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

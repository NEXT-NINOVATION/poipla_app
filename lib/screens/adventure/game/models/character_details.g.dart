// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_details.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FishTypeAdapter extends TypeAdapter<FishType> {
  @override
  final int typeId = 1;

  @override
  FishType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return FishType.suu;
      case 1:
        return FishType.sameko;
      case 2:
        return FishType.kamekiti;
      default:
        return FishType.suu;
    }
  }

  @override
  void write(BinaryWriter writer, FishType obj) {
    switch (obj) {
      case FishType.suu:
        writer.writeByte(0);
        break;
      case FishType.sameko:
        writer.writeByte(1);
        break;
      case FishType.kamekiti:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FishTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

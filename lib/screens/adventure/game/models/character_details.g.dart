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
        return FishType.takosuke;
      case 2:
        return FishType.micchan;
      case 3:
        return FishType.kamekiti;
      case 4:
        return FishType.lala;
      case 5:
        return FishType.sameko;
      case 6:
        return FishType.takoyaki;
      case 7:
        return FishType.osakaCastle;
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
      case FishType.takosuke:
        writer.writeByte(1);
        break;
      case FishType.micchan:
        writer.writeByte(2);
        break;
      case FishType.kamekiti:
        writer.writeByte(3);
        break;
      case FishType.lala:
        writer.writeByte(4);
        break;
      case FishType.sameko:
        writer.writeByte(5);
        break;
      case FishType.takoyaki:
        writer.writeByte(6);
        break;
      case FishType.osakaCastle:
        writer.writeByte(7);
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

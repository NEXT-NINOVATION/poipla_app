// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PlayerDataAdapter extends TypeAdapter<PlayerData> {
  @override
  final int typeId = 0;

  @override
  PlayerData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PlayerData(
      fishType: fields[0] as FishType,
      ownedfishes: (fields[1] as List).cast<FishType>(),
      money: fields[3] as int,
    ).._highScore = fields[2] as int;
  }

  @override
  void write(BinaryWriter writer, PlayerData obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.fishType)
      ..writeByte(1)
      ..write(obj.ownedfishes)
      ..writeByte(2)
      ..write(obj._highScore)
      ..writeByte(3)
      ..write(obj.money);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlayerDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

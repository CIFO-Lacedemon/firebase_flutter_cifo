// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthDto _$AuthDtoFromJson(Map<String, dynamic> json) => AuthDto(
  idUser: json['idUser'] as String,
  isAnonymous: json['isAnonymous'] as bool?,
  eamil: json['eamil'] as String,
  secondName: json['secondName'] as String?,
  name: json['name'] as String?,
  photoUrl: json['photoUrl'] as String?,
  localPhotoPath: json['localPhotoPath'] as String?,
);

Map<String, dynamic> _$AuthDtoToJson(AuthDto instance) => <String, dynamic>{
  'idUser': instance.idUser,
  'eamil': instance.eamil,
  'name': instance.name,
  'secondName': instance.secondName,
  'isAnonymous': instance.isAnonymous,
  'photoUrl': instance.photoUrl,
  'localPhotoPath': instance.localPhotoPath,
};

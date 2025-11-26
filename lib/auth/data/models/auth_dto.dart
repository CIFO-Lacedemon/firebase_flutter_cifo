import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_dto.g.dart';

@JsonSerializable()
class AuthDto {
  final String idUser;
  final String eamil;
  final String? name;
  final String? secondName;
  final bool? isAnonymous;

  AuthDto({
    required this.idUser,

    required this.isAnonymous,
    required this.eamil,
    required this.secondName,
    required this.name,
  });

  /// Connect the generated [_$PersonFromJson] function to the `fromJson`
  /// factory.
  factory AuthDto.fromJson(Map<String, dynamic> json) =>
      _$AuthDtoFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$AuthDtoToJson(this);

  factory AuthDto.fromFirebaseUser(UserCredential firebaseUser) {
    final String idUser = firebaseUser.user?.uid ?? '';
    final bool? isAnonymous = firebaseUser.user?.isAnonymous;

    return AuthDto(
      idUser: idUser,
      isAnonymous: isAnonymous,
      eamil: firebaseUser.user?.email ?? '',
      name: firebaseUser.user?.displayName ?? '',
      secondName: null,
    );
  }
}

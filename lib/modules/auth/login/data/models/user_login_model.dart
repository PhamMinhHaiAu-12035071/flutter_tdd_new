import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_login_model.g.dart';

@JsonSerializable(explicitToJson: true)
class UserLogin extends Equatable {
  const UserLogin({
    required this.email,
    required this.password,
  });

  factory UserLogin.fromJson(Map<String, dynamic> json) =>
      _$UserLoginFromJson(json);

  final String email;
  final String password;

  Map<String, dynamic> toJson() => _$UserLoginToJson(this);

  @override
  List<Object?> get props => [email, password];
}

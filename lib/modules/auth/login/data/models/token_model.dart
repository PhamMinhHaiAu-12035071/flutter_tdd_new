import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'token_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Token extends Equatable {
  const Token({required this.token});

  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);

  final String token;

  Map<String, dynamic> toJson() => _$TokenToJson(this);

  @override
  List<Object?> get props => [token];
}

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'error_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Error extends Equatable {
  const Error({required this.error});

  factory Error.fromJson(Map<String, dynamic> json) => _$ErrorFromJson(json);

  final String error;

  Map<String, dynamic> toJson() => _$ErrorToJson(this);

  @override
  List<Object?> get props => [error];
}

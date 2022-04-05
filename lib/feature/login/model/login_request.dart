import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'login_request.g.dart';

@JsonSerializable()
class LoginRequest extends INetworkModel<LoginRequest> {
  String mail;
  String password;

  LoginRequest({
    required this.mail,
    required this.password,
  });

  factory LoginRequest.fromJson(Map<String, Object?> json) {
    return _$LoginRequestFromJson(json);
  }

  @override
  LoginRequest fromJson(Map<String, Object?> json) {
    return _$LoginRequestFromJson(json);
  }

  @override
  Map<String, Object?> toJson() {
    return _$LoginRequestToJson(this);
  }
}

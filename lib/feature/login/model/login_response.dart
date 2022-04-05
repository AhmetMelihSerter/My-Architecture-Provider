import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse extends INetworkModel<LoginResponse> {
  String? token;

  LoginResponse({
    this.token,
  });

  factory LoginResponse.fromJson(Map<String, Object?> json) {
    return _$LoginResponseFromJson(json);
  }

  @override
  LoginResponse fromJson(Map<String, Object?> json) {
    return _$LoginResponseFromJson(json);
  }

  @override
  Map<String, Object?> toJson() {
    return _$LoginResponseToJson(this);
  }
}

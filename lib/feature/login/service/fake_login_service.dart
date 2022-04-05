import '../model/login_request.dart';
import '../model/login_response.dart';
import 'i_login_service.dart';

class FakeLoginService extends ILoginService {
  final _loginResponse = LoginResponse(
    token: "1234",
  );

  @override
  Future<LoginResponse?> login(LoginRequest model) async {
    return await Future.delayed(
      duration,
      () => _loginResponse,
    );
  }
}

import 'package:vexana/vexana.dart';

import '../model/login_request.dart';
import '../model/login_response.dart';
import 'i_login_service.dart';

class LoginService extends ILoginService {
  final String _loginRoute = 'login/';

  @override
  Future<LoginResponse?> login(LoginRequest model) async {
    final response = await manager.send<LoginResponse, LoginResponse>(
      _loginRoute,
      parseModel: LoginResponse(),
      data: model,
      method: RequestType.POST,
    );
    if (response is LoginResponse) {
      return response.data;
    } else {
      return null;
    }
  }
}

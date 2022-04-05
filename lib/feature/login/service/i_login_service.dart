import '../../../core/base/service/base_service.dart';
import '../model/login_request.dart';
import '../model/login_response.dart';

abstract class ILoginService extends BaseService {
  Future<LoginResponse?> login(LoginRequest model);
}

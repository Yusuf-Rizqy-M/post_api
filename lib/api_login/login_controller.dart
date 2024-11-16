// login_controller.dart
import 'package:get/get.dart';
import 'package:post_api/api_login/ApiService.dart';


class LoginController extends GetxController {
  var isLoading = false.obs;
  var loginStatus = "".obs;
  var token = "".obs;

  final ApiServiceLogin _loginService = ApiServiceLogin();

  Future<void> login(String username, String password) async {
    isLoading.value = true;
    try {
      final response = await _loginService.login(username, password);
      if (response["status"] == true) {
        loginStatus.value = response["message"];
        token.value = response["token"];
      } else {
        loginStatus.value = "Login failed";
      }
    } catch (e) {
      loginStatus.value = "Error: ${e.toString()}";
    } finally {
      isLoading.value = false;
    }
  }
}

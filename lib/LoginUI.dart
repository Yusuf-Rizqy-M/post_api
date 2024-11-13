// login_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'LoginController.dart';


class LoginPage extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(labelText: "Username"),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: "Password"),
              obscureText: true,
            ),
            SizedBox(height: 16),
            Obx(() => ElevatedButton(
              onPressed: controller.isLoading.value
                  ? null
                  : () {
                controller.login(
                  usernameController.text,
                  passwordController.text,
                );
              },
              child: controller.isLoading.value
                  ? CircularProgressIndicator(
                color: Colors.white,
              )
                  : Text("Login"),
            )),
            SizedBox(height: 16),
            Obx(() => Text(
              controller.loginStatus.value,
              style: TextStyle(color: Colors.red),
            ),
            ),
            Obx(() => Text(
              controller.token.value,
            )
            ),

          ],
        ),
      ),
    );
  }
}

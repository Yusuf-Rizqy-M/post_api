import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widget/my_text.dart';
import '../widget/my_textfield.dart';
import 'register_controller.dart';

class RegisterPage extends StatelessWidget {
  final RegisterController controller = Get.put(RegisterController());
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  void register(BuildContext context) {
    if (usernameController.text.isEmpty ||
        passwordController.text.isEmpty ||
        fullNameController.text.isEmpty ||
        emailController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Semua field harus diisi!'),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      controller.register(
        usernameController.text,
        passwordController.text,
        fullNameController.text,
        emailController.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 40),
            Image.asset(
              "assets/images/vibe.png",
              width: 250,
              height: 250,
            ),
            MyTextField(
              hintText: 'Username',
              controller: usernameController,
            ),
            MyTextField(
              hintText: 'Password',
              controller: passwordController,
            ),
            MyTextField(
              hintText: 'Full Name',
              controller: fullNameController,
            ),
            MyTextField(
              hintText: 'Email',
              controller: emailController,
            ),
            SizedBox(height: 20),
            Obx(() {
              return controller.isLoading.value
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                onPressed: () => register(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Warna background button
                  padding: EdgeInsets.symmetric(
                      vertical: 15, horizontal: 20), // Padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // Radius
                  ),
                  elevation: 5, // Efek bayangan
                ),
                child: Text(
                  'Register',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            }),
            SizedBox(height: 20),
            Obx(() {
              return Text(
                controller.registerStatus.value,
                style: TextStyle(color: Colors.green),
              );
            }),
          ],
        ),
      ),
    );
  }
}

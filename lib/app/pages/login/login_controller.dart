import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginController extends GetxController {
  var isLoading = false.obs;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final String apiUrl = "https://your-laravel-app.com/api/login"; // Replace with your API URL

  void login() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      Get.snackbar("Error", "Email and Password cannot be empty");
      return;
    }

    isLoading.value = true;

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Accept': 'application/json'},
        body: {
          'email': emailController.text,
          'password': passwordController.text,
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data['user']['is_admin'] == true) {
          Get.offNamed('/admin'); // Navigate to Admin page
        } else {
          Get.offNamed('/faculty'); // Navigate to Faculty page
        }
      } else {
        Get.snackbar("Login Failed", "Invalid credentials");
      }
    } catch (e) {
      Get.snackbar("Error", "Something went wrong");
    } finally {
      isLoading.value = false;
    }
  }
}

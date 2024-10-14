import 'package:flutter/material.dart';

class RegistrationModel with ChangeNotifier {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  String? lastEmail;
  String? lastPassword;

  bool obscurePassword = true;
  bool obscureConfirmPassword = true;
  bool registering = false;

  void togglePasswordVisibility() {
    obscurePassword = !obscurePassword;
    notifyListeners();
  }

  void toggleConfirmPasswordVisibility() {
    obscureConfirmPassword = !obscureConfirmPassword;
    notifyListeners();
  }

  String? validateName(String? value, String fieldName, int minLength, int maxLength) {
    if (value == null || value.isEmpty) {
      return 'Please enter your $fieldName';
    } else if (value.length < minLength || value.length > maxLength) {
      return '$fieldName must be between $minLength and $maxLength characters';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value != passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  Future<void> register(BuildContext context, GlobalKey<FormState> formKey) async {
    if (formKey.currentState!.validate()) {
      registering = true;
      notifyListeners();

      await Future.delayed(const Duration(seconds: 2)); // จำลองเวลาในการลงทะเบียน

      lastEmail = emailController.text;
      lastPassword = passwordController.text;

      Navigator.pushNamed(context, '/');
      
      registering = false;
      notifyListeners();
    }
  }
}

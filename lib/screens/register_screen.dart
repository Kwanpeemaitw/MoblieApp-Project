import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _confirmPassword = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool registering = false;
  String name = '';
  String email = '';
  String password = '';
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  String? validateName(String? value, String label, int min, int max) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
    if (value.length < min || value.length > max) {
      return 'Enter $label with length $min - $max characters';
    }
    if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
      return 'Name can only contain letters and spaces';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!RegExp(r'^[^@]+@(?:gmail)\.com$').hasMatch(value)) {
      return 'Only emails ending with @gmail.com are allowed';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    if (!RegExp(r'\d').hasMatch(value)) {
      return 'Password must contain at least one number';
    }
    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return 'Password must contain at least one special character';
    }
    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != _password.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  void resetInput() {
    _formKey.currentState!.reset();
    _name.clear();
    _email.clear();
    _password.clear();
    _confirmPassword.clear();
  }

  void registration() {
    showProcessingSnackBar();
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        registering = true;
        name = _name.text;
        email = _email.text;
        password = _password.text;
      });
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          registering = false;
        });
        showSuccessSnackBar();
        resetInput();
      });
    } else {
      showErrorSnackBar('Please check the entered information');
    }
  }

  void showProcessingSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Processing'),
        backgroundColor: Colors.brown,
        duration: Duration(seconds: 2),
      ),
    );
  }

  void showSuccessSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Expanded(child: const Text('Registration Success')),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/profileSetup');
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.transparent,
                padding: EdgeInsets.zero,
              ),
              child: const Text(
                'Set Up Profile',
                style: TextStyle(
                  color: Colors.white,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.white,
                  decorationThickness: 2,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(10),
      ),
    );
  }

  void showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(10),
      ),
    );
  }

  Widget _buildTextFormField({
    required TextEditingController controller,
    required Color borderColor,
    required Color focusedBorderColor,
    required String labelText,
    required IconData icon,
    required String? Function(String?) validator,
    bool obscureText = false,
    Widget? suffixIcon,
    double width = 300,
    double height = 50,
  }) {
    return Container(
      width: width,
      height: height,
      child: TextFormField(
        controller: controller,
        validator: validator,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(color: Colors.black87),
          floatingLabelStyle: const TextStyle(fontSize: 16),
          prefixIcon: Icon(icon, color: borderColor),
          suffixIcon: suffixIcon,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: focusedBorderColor,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Image.asset(
        //   'assets/images/LogoBUS_0.png',
        //   height: 50,
        // ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 40),
            Center(
              child: Container(
                width: 340,
                height: 550,
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: const Color(0xFFD9D9D9),
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 5),
                    const Text(
                      'Create New',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      'Account',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: 'Already Registered? ',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF5A5A5A),
                            ),
                          ),
                          TextSpan(
                            text: 'Sign in ',
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushNamed(context, '/');
                              },
                          ),
                          const TextSpan(
                            text: 'here.',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF5A5A5A),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 25),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          _buildTextFormField(
                            controller: _name,
                            labelText: 'Name',
                            icon: Icons.person,
                            borderColor: Color(0xFFD9D9D9),
                            focusedBorderColor: Color(0xFF2C2C2C),
                            validator: (value) =>
                                validateName(value, 'Name', 1, 50),
                          ),
                          const SizedBox(height: 15),
                          _buildTextFormField(
                            controller: _email,
                            labelText: 'Email',
                            icon: Icons.email,
                            borderColor: Color(0xFFD9D9D9),
                            focusedBorderColor: Color(0xFF2C2C2C),
                            validator: validateEmail,
                          ),
                          const SizedBox(height: 15),
                          _buildTextFormField(
                            controller: _password,
                            labelText: 'Password',
                            icon: Icons.lock,
                            borderColor: Color(0xFFD9D9D9),
                            focusedBorderColor: Color(0xFF2C2C2C),
                            validator: validatePassword,
                            obscureText: _obscurePassword,
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscurePassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscurePassword = !_obscurePassword;
                                });
                              },
                            ),
                          ),
                          const SizedBox(height: 15),
                          _buildTextFormField(
                            controller: _confirmPassword,
                            labelText: 'Confirm Password',
                            icon: Icons.lock_outline,
                            borderColor: Color(0xFFD9D9D9),
                            focusedBorderColor: Color(0xFF2C2C2C),
                            validator: validateConfirmPassword,
                            obscureText: _obscureConfirmPassword,
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscureConfirmPassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscureConfirmPassword =
                                      !_obscureConfirmPassword;
                                });
                              },
                            ),
                          ),
                          const SizedBox(height: 40),
                          registering
                              ? CircularProgressIndicator()
                              : ElevatedButton(
                                  onPressed: registration,
                                  child: const Text(
                                    'Register',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF2C2C2C),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 108, vertical: 15),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

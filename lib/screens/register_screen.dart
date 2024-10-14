import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:musicapp_final/models/RegistrationModel.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
          prefixIcon: Icon(icon, color: borderColor),
          suffixIcon: suffixIcon,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor, width: 1.0),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: focusedBorderColor, width: 1.0),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RegistrationModel(),
      child: Consumer<RegistrationModel>(
        builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            title: Image.asset('assets/images/logoapp.png', height: 60),
            backgroundColor: Colors.white,
            centerTitle: true,
            automaticallyImplyLeading: false,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 30),
                Center(
                  child: Container(
                    width: 340,
                    height: 600,
                    padding: const EdgeInsets.all(25),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          color: const Color(0xFFD9D9D9), width: 1.0),
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
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          'Account',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        RichText(
                          text: TextSpan(
                            children: [
                              const TextSpan(
                                text: 'Already Registered? ',
                                style: TextStyle(
                                    fontSize: 14, color: Color(0xFF5A5A5A)),
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
                                    fontSize: 14, color: Color(0xFF5A5A5A)),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 45),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              _buildTextFormField(
                                controller: model.nameController,
                                labelText: 'Name',
                                icon: Icons.person,
                                borderColor: Color(0xFFD9D9D9),
                                focusedBorderColor: Color(0xFF2C2C2C),
                                validator: (value) =>
                                    model.validateName(value, 'Name', 1, 50),
                              ),
                              const SizedBox(height: 20),
                              _buildTextFormField(
                                controller: model.emailController,
                                labelText: 'Email',
                                icon: Icons.email,
                                borderColor: Color(0xFFD9D9D9),
                                focusedBorderColor: Color(0xFF2C2C2C),
                                validator: model.validateEmail,
                              ),
                              const SizedBox(height: 20),
                              _buildTextFormField(
                                controller: model.passwordController,
                                labelText: 'Password',
                                icon: Icons.lock,
                                borderColor: Color(0xFFD9D9D9),
                                focusedBorderColor: Color(0xFF2C2C2C),
                                validator: model.validatePassword,
                                obscureText: model.obscurePassword,
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    model.obscurePassword
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                  onPressed: model.togglePasswordVisibility,
                                ),
                              ),
                              const SizedBox(height: 20),
                              _buildTextFormField(
                                controller: model.confirmPasswordController,
                                labelText: 'Confirm Password',
                                icon: Icons.lock_outline,
                                borderColor: Color(0xFFD9D9D9),
                                focusedBorderColor: Color(0xFF2C2C2C),
                                validator: model.validateConfirmPassword,
                                obscureText: model.obscureConfirmPassword,
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    model.obscureConfirmPassword
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                  onPressed:
                                      model.toggleConfirmPasswordVisibility,
                                ),
                              ),
                              const SizedBox(height: 40),
                              model.registering
                                  ? const CircularProgressIndicator() 
                                  : ElevatedButton(
                                      onPressed: () {
                                        if (_formKey.currentState?.validate() ??
                                            false) {
                                          model.register(context, _formKey);
                                        }
                                      },
                                      child: const Text(
                                        'Register',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            const Color(0xFF2C2C2C),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 108, vertical: 15),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
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
        ),
      ),
    );
  }
}

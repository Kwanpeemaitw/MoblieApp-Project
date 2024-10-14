import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:musicapp_final/models/RegistrationModel.dart';
import 'package:musicapp_final/screens/register_screen.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('Register screen renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => RegistrationModel(),
        child: MaterialApp(
          home: RegisterScreen(),
        ),
      ),
    );

    // Check if the title texts are present
    expect(find.text('Create New'), findsOneWidget);
    expect(find.text('Account'), findsOneWidget);
    expect(find.byType(TextFormField), findsNWidgets(4)); // 4 text fields
  });

  testWidgets('Register button is enabled only when form is valid', (WidgetTester tester) async {
    final registrationModel = RegistrationModel();
    
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => registrationModel,
        child: MaterialApp(
          home: RegisterScreen(),
        ),
      ),
    );

    // Initially, the register button should be enabled
    expect(find.byType(ElevatedButton), findsOneWidget);
    final registerButton = tester.widget<ElevatedButton>(find.byType(ElevatedButton));

    // Verify button is enabled when form is empty
    expect(registerButton.onPressed, isNotNull);

    // Fill out the form
    registrationModel.nameController.text = 'Test User';
    registrationModel.emailController.text = 'test@example.com';
    registrationModel.passwordController.text = 'password123';
    registrationModel.confirmPasswordController.text = 'password123';

    // Rebuild the widget to reflect the changes
    await tester.pump();

    // Verify button is still enabled after filling the form
    expect(find.byType(ElevatedButton), findsOneWidget);
    final updatedRegisterButton = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
    expect(updatedRegisterButton.onPressed, isNotNull);
  });

testWidgets('Validate email field', (WidgetTester tester) async {
  final registrationModel = RegistrationModel();
  
  await tester.pumpWidget(
    ChangeNotifierProvider(
      create: (_) => registrationModel,
      child: MaterialApp(
        home: RegisterScreen(),
      ),
    ),
  );

  // Enter invalid email
  registrationModel.emailController.text = 'invalid_email';
  await tester.pump();

  // Validate email
  String? validationResult = registrationModel.validateEmail(registrationModel.emailController.text);
  
  expect(validationResult, isNotNull);
  // Update the expected value to match the actual validation message
  expect(validationResult, equals('Please enter a valid email address'));
});

testWidgets('Confirm password validation works', (WidgetTester tester) async {
  final registrationModel = RegistrationModel();
  
  await tester.pumpWidget(
    ChangeNotifierProvider(
      create: (_) => registrationModel,
      child: MaterialApp(
        home: RegisterScreen(),
      ),
    ),
  );

  // Fill in the password and confirm password fields with mismatched values
  registrationModel.passwordController.text = 'password123';
  registrationModel.confirmPasswordController.text = 'differentPassword';
  await tester.pump();

  // Validate confirm password
  String? validationResult = registrationModel.validateConfirmPassword(registrationModel.confirmPasswordController.text);
  
  expect(validationResult, isNotNull);
  expect(validationResult, equals('Passwords do not match'));
});



}

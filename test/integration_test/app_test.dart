// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:integration_test/integration_test.dart';
// import 'package:musicapp_final/main.dart'; // ไฟล์ main.dart ของคุณ

// void main() {
//   IntegrationTestWidgetsFlutterBinding.ensureInitialized();

//   testWidgets('Full registration process', (WidgetTester tester) async {
//     // เริ่มต้นแอปพลิเคชัน
//     await tester.pumpWidget(MyApp());

//     // ไปที่หน้าลงทะเบียน
//     await tester.tap(find.text('Register'));
//     await tester.pumpAndSettle();

//     // ป้อนข้อมูลในฟิลด์
//     await tester.enterText(find.byType(TextFormField).at(0), 'John Doe'); // Name
//     await tester.enterText(find.byType(TextFormField).at(1), 'johndoe@gmail.com'); // Email
//     await tester.enterText(find.byType(TextFormField).at(2), 'Password123!'); // Password
//     await tester.enterText(find.byType(TextFormField).at(3), 'Password123!'); // Confirm Password

//     // คลิกปุ่มลงทะเบียน
//     await tester.tap(find.text('Register'));
//     await tester.pumpAndSettle();

//     // ตรวจสอบข้อความที่แสดงผลหลังการลงทะเบียน
//     expect(find.text('Registration Success'), findsOneWidget); // เปลี่ยนเป็นข้อความที่คาดหวังหลังการลงทะเบียน
//   });
// }

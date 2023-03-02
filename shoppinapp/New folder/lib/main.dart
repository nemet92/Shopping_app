// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       home: AuthScreen(),
//     );
//   }
// }

// import 'package:email_auth/email_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(const MyApp());
// }

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   EmailAuth? emailAuth;
//   void sendOtp() async {
//     bool result = await emailAuth!
//         .sendOtp(recipientMail: _emailcontroller.value.text, otpLength: 5);
//     if (result) {
//       submitValid = true;
//     }
//   }

//   void verify() {
//     print(emailAuth!.validateOtp(
//         recipientMail: _emailcontroller.value.text,
//         userOtp: _otpcontroller.value.text));
//   }

//   bool submitValid = false;

//   /// Text editing controllers to get the value from text fields
//   final TextEditingController _emailcontroller = TextEditingController();
//   final TextEditingController _otpcontroller = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Email Auth sample'),
//         ),
//         body: Container(
//           margin: const EdgeInsets.all(5),
//           child: Center(
//               child: Center(
//             child: Column(
//               children: <Widget>[
//                 TextField(
//                   controller: _emailcontroller,
//                 ),
//                 Card(
//                   margin: const EdgeInsets.only(top: 20),
//                   elevation: 6,
//                   child: Container(
//                     height: 50,
//                     width: 200,
//                     color: Colors.green[400],
//                     child: GestureDetector(
//                       onTap: sendOtp,
//                       child: const Center(
//                         child: Text(
//                           "Request OTP",
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white,
//                             fontSize: 20,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),

//                 /// A dynamically rendering text field
//                 (submitValid)
//                     ? TextField(
//                         controller: _otpcontroller,
//                       )
//                     : Container(height: 1),
//                 (submitValid)
//                     ? Container(
//                         margin: const EdgeInsets.only(top: 20),
//                         height: 50,
//                         width: 200,
//                         color: Colors.green[400],
//                         child: GestureDetector(
//                           onTap: verify,
//                           child: const Center(
//                             child: Text(
//                               "Verify",
//                               style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.white,
//                                 fontSize: 20,
//                               ),
//                             ),
//                           ),
//                         ),
//                       )
//                     : const SizedBox(height: 1)
//               ],
//             ),
//           )),
//         ),
//       ),
//     );
//   }
// }

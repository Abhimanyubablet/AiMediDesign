// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:smarthealth/screen/forgot/forgot.dart';
// import 'package:smarthealth/screen/pharmacyReg.dart';
// import 'package:smarthealth/screen/pharmacyinterface.dart';
//
// import 'package:smarthealth/screen/authentication/login_page.dart';
// import '../../consts/colors.dart';
// import '../../home_screen/dashboard_page.dart';
// import 'registration.dart';
// import '../location/country.dart';
//
// class EmailPage extends StatefulWidget {
//   // final String fromScreen;
//   // SignInPage({required this.fromScreen});
//
//   @override
//   _EmailPageState createState() => _EmailPageState();
// }
//
// class _EmailPageState extends State<EmailPage> {
//   // final TextEditingController _mobileController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _emailController =
//       TextEditingController(); // Change controller name
//
//   String loggedInEmail = ''; // Declare loggedInEmail here
//   bool _isPasswordVisible = false;
//   String loggedInUserId = '';
//
//   final GoogleSignIn _googleSignIn = GoogleSignIn();
//
//   Future<void> _signInWithGoogle() async {
//     // Trigger Google Sign-In flow
//     final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
//
//     if (googleUser != null) {
//       // Handle successful sign-in (e.g., navigate to a different screen)
//       print('Signed in with Google ID: ${googleUser.id}');
//       // Access additional user information (optional)
//       final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
//       final String? accessToken = googleAuth.accessToken;
//       final String? idToken = googleAuth.idToken;
//       print('Access Token: $accessToken');
//       print('ID Token: $idToken');
//     } else {
//       print('Sign-in cancelled by user.');
//     }
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     // checkLoginStatus();
//   }
//
//   Future<void> checkLoginStatus() async {
//     final prefs = await SharedPreferences.getInstance();
//     final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
//     final loggedInEmail = prefs.getString('loggedInEmail') ?? '';
//
//     if (isLoggedIn) {
//       // If the user is already logged in, navigate to HospitalDashboardPage
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//           builder: (context) => HospitalDashboardPage(
//             loggedInEmail: loggedInEmail,
//             cityName: '',
//           ),
//         ),
//       );
//     }
//   }
//
//   void _performSignIn() async {
//     String email = _emailController.text.toLowerCase();
//
//     print(email);
//
//     final bool isSignInSuccessful = await _signInUser(email);
//
//     if (isSignInSuccessful) {
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       final loggedInEmail = prefs.getString('loggedInEmail') ??
//           ''; // Retrieve the email from shared preferences
//       print('Logged in email: $loggedInEmail');
//
//       // Retrieve the user ID from the API response
//       final String loggedInUserId = await _getUserIdFromApiResponse();
//       final String userType =
//           await _getUserTypeFromApiResponse(); // Retrieve the user type from the API response
//       final String firstName =
//           await _getFirstNameFromApiResponse(); // Retrieve the first name from the API response
//       final String lastName =
//           await _getLastNameFromApiResponse(); // Retrieve the last name from the API response
//       final String mobile_no = await _getMobileApiResponse();
//
//       // Store user login info and navigate to HospitalDashboardPage
//       await _storeUserLoginInfo(
//           loggedInEmail, loggedInUserId, userType, firstName, lastName);
//
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//           builder: (context) => HospitalDashboardPage(
//             loggedInEmail: loggedInEmail,
//             cityName: '',
//           ),
//         ),
//       );
//     }
//   }
//
//   Future<void> _storeProfileUpdatedStatus(bool isProfileUpdated) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setBool('isProfileUpdated', isProfileUpdated);
//
//     print(
//         'Profile updated status stored in shared preferences: $isProfileUpdated');
//   }
//
//   Future<String> _getUserIdFromApiResponse() async {
//     final apiUrl = 'https://smartmed.co.in:3000/api/user/login';
//     // final apiUrl = 'https://metacare.co.in:3002/api/user/login';
//
//     final Map<String, dynamic> requestData = {
//       "email_id": _emailController.text,
//       "password": _passwordController.text,
//     };
//
//     final response = await http.post(
//       Uri.parse(apiUrl),
//       headers: {
//         'accept': '*/*',
//         'Content-Type': 'application/json',
//       },
//       body: jsonEncode(requestData),
//     );
//
//     if (response.statusCode == 201) {
//       final responseData = jsonDecode(response.body);
//
//       if (responseData['details'] != null &&
//           responseData['details']['id'] != null) {
//         final String userId = responseData['details']['id'];
//         return userId;
//       } else {
//         throw Exception('User ID not found in API response');
//       }
//     } else {
//       throw Exception('API request failed');
//     }
//   }
//
//   Future<bool> _signInUser(String email) async {
//     final apiUrl = 'https://smartmed.co.in:3000/api/user/login';
//
//     final Map<String, dynamic> requestData = {
//       "email_id": email,
//       "password": _passwordController.text,
//     };
//
//     final response = await http.post(
//       Uri.parse(apiUrl),
//       headers: {
//         'accept': '*/*',
//         'Content-Type': 'application/json',
//       },
//       body: jsonEncode(requestData),
//     );
//
//     if (response.statusCode == 201) {
//       final responseData = jsonDecode(response.body);
//       print("API Response Data: $responseData");
//
//       if (responseData['errorCode'] != 200) {
//         // Handle sign-in failure
//         final errorMessage = responseData['message'];
//         print("Error Message: $errorMessage");
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//           content: Text(errorMessage),
//         ));
//         return false;
//       } else {
//         if (responseData['details'] != null) {
//           final String userType = responseData['details']['user_type'];
//           final String firstName = responseData['details']['f_name'];
//           final String lastName = responseData['details']['l_name'];
//           final String loggedInUserId = responseData['details']['id'];
//           final String mobileNumber =
//               responseData['details']['mobile_no'].toString();
//           final String loggedInEmail = responseData['details']['email_id'];
//
//           // Store mobile number
//           await _storeLoginInfo(mobileNumber);
//
//           // Store user login info
//           await _storeUserLoginInfo(
//               loggedInEmail, loggedInUserId, userType, firstName, lastName);
//
//           // Navigate based on user type
//           if (userType == 'Pharmacy') {
//             if (responseData['details']['profile_updated'] == false) {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => PharmacyProfileForm(),
//                 ),
//               );
//             } else {
//               Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => PharmacyInterface(
//                     pharmacyName: '', // Add necessary values
//                     email: loggedInEmail,
//                     address: '',
//                     licenseNumber: '',
//                     gstNumber: '',
//                     panNumber: '',
//                   ),
//                 ),
//               );
//             }
//           } else if (userType == 'User/Patient') {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => CountryListPage(),
//               ),
//             );
//           }
//
//           return true;
//         } else {
//           // Handle the case when the API response does not contain the expected data
//           return false;
//         }
//       }
//     } else {
//       // HTTP request failed, show an error message
//       _showSignInErrorDialog('An error occurred. Please try again later.');
//       return false;
//     }
//   }
//
//   Future<void> _storeLoginInfo(String mobileNumber) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     // await prefs.setString('userType', userType);
//     await prefs.setString('mobileNumber', mobileNumber);
//   }
//
//   Future<String> _getUserTypeFromApiResponse() async {
//     final apiUrl = 'https://smartmed.co.in:3000/api/user/login';
//
//     final Map<String, dynamic> requestData = {
//       "mobile_no": _emailController.text,
//       "password": _passwordController.text,
//     };
//
//     final response = await http.post(
//       Uri.parse(apiUrl),
//       headers: {
//         'accept': '*/*',
//         'Content-Type': 'application/json',
//       },
//       body: jsonEncode(requestData),
//     );
//
//     if (response.statusCode == 201) {
//       final responseData = jsonDecode(response.body);
//       print("API Response Data: $responseData");
//
//       if (responseData['errorCode'] != 200) {
//         // Handle error case
//         throw Exception('Error occurred: ${responseData['errorMessage']}');
//       } else {
//         if (responseData['details'] != null) {
//           final String userType = responseData['details']['user_type'];
//           return userType;
//         } else {
//           throw Exception('User type not found in API response');
//         }
//       }
//     } else {
//       throw Exception('API request failed');
//     }
//   }
//
//   Future<String> _getFirstNameFromApiResponse() async {
//     final apiUrl = 'https://smartmed.co.in:3000/api/user/login';
//
//     final Map<String, dynamic> requestData = {
//       "email_id": _emailController.text,
//       "password": _passwordController.text,
//     };
//
//     final response = await http.post(
//       Uri.parse(apiUrl),
//       headers: {
//         'accept': '*/*',
//         'Content-Type': 'application/json',
//       },
//       body: jsonEncode(requestData),
//     );
//
//     if (response.statusCode == 201) {
//       final responseData = jsonDecode(response.body);
//       print("API Response Data: $responseData");
//
//       if (responseData['errorCode'] != 200) {
//         // Handle error case
//         throw Exception('Error occurred: ${responseData['errorMessage']}');
//       } else {
//         if (responseData['details'] != null) {
//           final String firstName = responseData['details']['first_name'];
//           return firstName;
//         } else {
//           throw Exception('First name not found in API response');
//         }
//       }
//     } else {
//       throw Exception('API request failed');
//     }
//   }
//
//   Future<String> _getLastNameFromApiResponse() async {
//     final apiUrl = 'https://smartmed.co.in:3000/api/user/login';
//
//     final Map<String, dynamic> requestData = {
//       "email_id": _emailController.text,
//       "password": _passwordController.text,
//     };
//
//     final response = await http.post(
//       Uri.parse(apiUrl),
//       headers: {
//         'accept': '*/*',
//         'Content-Type': 'application/json',
//       },
//       body: jsonEncode(requestData),
//     );
//
//     if (response.statusCode == 201) {
//       final responseData = jsonDecode(response.body);
//       print("API Response Data: $responseData");
//
//       if (responseData['errorCode'] != 200) {
//         // Handle error case
//         throw Exception('Error occurred: ${responseData['errorMessage']}');
//       } else {
//         if (responseData['details'] != null) {
//           final String lastName = responseData['details']['last_name'];
//           return lastName;
//         } else {
//           throw Exception('Last name not found in API response');
//         }
//       }
//     } else {
//       throw Exception('API request failed');
//     }
//   }
//
//   Future<String> _getMobileApiResponse() async {
//     final apiUrl = 'https://smartmed.co.in:3000/api/user/login';
//
//     final Map<String, dynamic> requestData = {
//       "email_id": _emailController.text,
//       "password": _passwordController.text,
//     };
//
//     final response = await http.post(
//       Uri.parse(apiUrl),
//       headers: {
//         'accept': '*/*',
//         'Content-Type': 'application/json',
//       },
//       body: jsonEncode(requestData),
//     );
//
//     if (response.statusCode == 201) {
//       final responseData = jsonDecode(response.body);
//       print("API Response Data: $responseData");
//
//       if (responseData['errorCode'] != 200) {
//         // Handle error case
//         throw Exception('Error occurred: ${responseData['errorMessage']}');
//       } else {
//         if (responseData['details'] != null) {
//           final String mobile_no =
//               responseData['details']['email_id'].toString();
//           return mobile_no;
//         } else {
//           throw Exception('Last name not found in API response');
//         }
//       }
//     } else {
//       throw Exception('API request failed');
//     }
//   }
//
//   Future<void> _storeUserResponse(Map<String, dynamic> responseData) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     // Serialize the responseData map to JSONF
//     final String responseJson = jsonEncode(responseData);
//     prefs.setString('user_response', responseJson);
//
//     // Store the email_id separately in shared preferences
//     final String emailId = responseData['details']['email_id'] ?? '';
//     final String userId = responseData['details']['id'] ??
//         ''; // Add this line to store the user ID
//     prefs.setString('email_id', emailId);
//     prefs.setString('user_id', userId); // Store the user ID
//
//     print('Data stored in shared preferences: $responseJson');
//     print('Email ID stored: $emailId');
//     print('User ID stored: $userId'); // Print the user ID
//   }
//
//   Future<void> _storeUserLoginInfo(
//     String userEmail,
//     String loggedInUserId,
//     String userType,
//     String firstName,
//     String lastName,
//   ) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setBool('isLoggedIn', true);
//     prefs.setString('loggedInEmail', userEmail);
//     prefs.setString(
//         'loggedInUserId', loggedInUserId); // Store the user ID as well
//     prefs.setString('userType', userType); // Store the user type
//     prefs.setString('firstName', firstName); // Store the first name
//     prefs.setString('lastName', lastName); // Store the last name
//
//     print('User login info stored in shared preferences');
//     print('Logged in email: $userEmail'); // Print the logged-in email
//     print('User ID: $loggedInUserId'); // Print the user ID
//   }
//
//   void _showSignInErrorDialog(String errorMessage) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Sign-In Failed'),
//           content: Text(errorMessage),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop(); // Close the dialog
//               },
//               child: Text('OK'),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   Widget _buildSignInLink() {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             GestureDetector(
//               onTap: () {
//                 // Navigator.push(
//                 //   context,
//                 //   MaterialPageRoute(builder: (context) => SignInPage()),
//                 // );
//               },
//               child: Text(
//                 "Don't have an account?",
//                 style: TextStyle(
//                   color: Colors.black54,
//                   fontWeight: FontWeight.w500,
//                   fontSize: 13
//                 ),
//               ),
//             ),
//             SizedBox(width: 5),
//             GestureDetector(
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => RegistrationPage()),
//                 );
//               },
//               child: Text(
//                 'Sign up',
//                 style: TextStyle(
//                   color: bgColor,
//                   fontWeight: FontWeight.w500,
//                     fontSize: 13
//                 ),
//               ),
//             ),
//           ],
//         ),
//
//       ],
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: lightBlue,
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(height: 40),
//               Container(
//                 child: Container(
//                   // width: MediaQuery.of(context).size.width * 0.2,
//                   // height: MediaQuery.of(context).size.height * 0.1,
//                   width: 60,
//                   height: 60,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20.0),
//                   ),
//                   child: Image.asset('assets/images/login_img.png'),
//                 ),
//               ),
//               Container(
//                 child: Text(
//                   "Let's Sign in",
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.w500,
//                     color: lightBlack,
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Container(
//                 child: Text(
//                   "Welcome Back, You've",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: Colors.black54,
//                   ),
//                 ),
//               ),
//               Container(
//                 child: Text(
//                   "been missed!",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: Colors.black54,
//                   ),
//                 ),
//               ),
//               SizedBox(height: MediaQuery.of(context).size.height * 0.03),
//
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Container(child: Text("Email",style: TextStyle(color: Colors.black54),),),
//                   SizedBox(height: 5,),
//                   Container(
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(8.0),
//                     ),
//                     child: TextField(
//                       controller: _emailController,
//                       decoration: InputDecoration(
//                           hintText: 'abc@gmail.com',
//                         hintStyle: TextStyle(
//                             fontWeight: FontWeight.w400, color: Colors.black54),
//                           prefixIcon: Icon(
//                             Icons.email,
//                             color: Colors.black54,
//                           ),
//                           contentPadding: EdgeInsets.symmetric(
//                               vertical: 16.0, horizontal: 17.0),
//                         border: OutlineInputBorder(
//                           borderSide: BorderSide(
//                             color: Colors.black, // Border color
//                             width: 1.0, // Border width
//                           ),
//                           borderRadius: BorderRadius.circular(10.0), // Border radius
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: MediaQuery.of(context).size.height * 0.02),
//                   Container(child: Text("Password",style: TextStyle(color: Colors.black54),),),
//                   SizedBox(height: 5,),
//                   Container(
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(8.0),
//                     ),
//                     child: TextField(
//                       controller: _passwordController,
//                       decoration: InputDecoration(
//                           hintText: 'Abcd@123',
//                         hintStyle: TextStyle(
//                             fontWeight: FontWeight.w400, color: Colors.black54),
//                           prefixIcon: Icon(
//                             Icons.lock,
//                             color: Colors.black54,
//                           ),
//                           suffixIcon: IconButton(
//                             icon: Icon(
//                               _isPasswordVisible
//                                   ? Icons.visibility
//                                   : Icons.visibility_off,
//                               // Customize icon color
//                             ),
//                             onPressed: () {
//                               setState(() {
//                                 _isPasswordVisible = !_isPasswordVisible;
//                               });
//                             },
//                           ),
//                           contentPadding: EdgeInsets.symmetric(
//                               vertical: 12.0, horizontal: 16.0),
//                         border: OutlineInputBorder(
//                           borderSide: BorderSide(
//                             color: Colors.black, // Border color
//                             width: 1.0, // Border width
//                           ),
//                           borderRadius: BorderRadius.circular(10.0), // Border radius
//                         ),
//                       ),
//                       obscureText: !_isPasswordVisible,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 15,
//                   ),
//                   Container(
//                     width: double.infinity,
//                     child: ElevatedButton(
//                       onPressed: _performSignIn,
//                       style: ElevatedButton.styleFrom(
//                         foregroundColor: Colors.white,
//                         backgroundColor: bgColor,
//                         padding: EdgeInsets.symmetric(vertical: 13.0),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8.0),
//                         ),
//                         textStyle: TextStyle(
//                           fontSize: 15.0,
//                         ),
//                       ),
//                       child: Text(
//                         'Login',
//                         style: TextStyle(fontWeight: FontWeight.w500),
//                       ),
//                     ),
//                   ),
//                   Center(
//                     child: TextButton(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => LoginPage(),
//                           ),
//                         );
//                       },
//                       child: Text(
//                         "If you want sign In with phone ? Click here",
//                         style: TextStyle(
//                             fontSize: 13,
//                             color: bgColor
//                         ),
//                       ),
//                     ),
//                   ),
//
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       GestureDetector(
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => ForgotPasswordPage()),
//                           );
//                         },
//                         child: Text(
//                           "Forgot Password?",
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             fontSize: 12,
//                             fontWeight: FontWeight.w500,
//                             color:
//                             bgColor, // Change color to match your design
//                           ),
//                         ),
//                       ),
//
//                       _buildSignInLink(),
//                     ],
//                   ),
//
//                   // SizedBox(
//                   //   height: 10,
//                   // ),
//                   //
//                   // Row(
//                   //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   //   children: [
//                   //     Container(
//                   //       width: 80,
//                   //       decoration: BoxDecoration(
//                   //         border: Border.all(
//                   //           width: 0.5,
//                   //         ),
//                   //       ),
//                   //     ),
//                   //     SizedBox(
//                   //       width: 10,
//                   //     ),
//                   //     Container(
//                   //       child: Text("Or Continue with",
//                   //           style: TextStyle(fontWeight: FontWeight.w500)),
//                   //     ),
//                   //     SizedBox(
//                   //       width: 10,
//                   //     ),
//                   //     Container(
//                   //       width: 80,
//                   //       decoration: BoxDecoration(
//                   //         border: Border.all(
//                   //           width: 0.5,
//                   //         ),
//                   //       ),
//                   //     ),
//                   //   ],
//                   // ),
//                   // SizedBox(height: 30,),
//                   // Row(
//                   //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   //   children: [
//                   //
//                   //     Center(
//                   //       child: Container(
//                   //         height: 70,
//                   //         width: 150,
//                   //         decoration: BoxDecoration(
//                   //           boxShadow: [
//                   //             BoxShadow(
//                   //               color: Colors.grey.withOpacity(0.2), // Color of the shadow
//                   //               spreadRadius: 5, // Spread radius
//                   //               blurRadius: 7, // Blur radius
//                   //               offset: Offset(0, 3), // Offset in x and y directions
//                   //             ),
//                   //           ],
//                   //         ),
//                   //         child: ElevatedButton.icon(
//                   //           // onPressed: _signInWithGoogle,
//                   //           onPressed: (){},
//                   //           icon: Icon(Icons.g_mobiledata_outlined, size: 50),
//                   //           label: const Text('Google', style: TextStyle(fontSize: 16)),
//                   //           style: ElevatedButton.styleFrom(
//                   //             foregroundColor: Colors.black87,
//                   //             // backgroundColor: Colors.white,
//                   //             backgroundColor: Colors.grey,
//                   //             shape: RoundedRectangleBorder(
//                   //               borderRadius: BorderRadius.circular(10.0),
//                   //             ),
//                   //           ),
//                   //         ),
//                   //       ),
//                   //     ),
//                   //
//                   //     Center(
//                   //       child: Container(
//                   //         height: 70,
//                   //         width: 170,
//                   //         decoration: BoxDecoration(
//                   //           boxShadow: [
//                   //             BoxShadow(
//                   //               color: Colors.grey.withOpacity(0.2), // Color of the shadow
//                   //               spreadRadius: 5, // Spread radius
//                   //               blurRadius: 7, // Blur radius
//                   //               offset: Offset(0, 3), // Offset in x and y directions
//                   //             ),
//                   //           ],
//                   //         ),
//                   //         child: ElevatedButton.icon(
//                   //           onPressed: (){},
//                   //           icon: Icon(Icons.facebook,size: 50,),
//                   //           label: const Text('facebook', style: TextStyle(fontSize: 16)),
//                   //           style: ElevatedButton.styleFrom(
//                   //             foregroundColor: Colors.black87,
//                   //             // backgroundColor: Colors.white,
//                   //             backgroundColor: Colors.grey,
//                   //             shape: RoundedRectangleBorder(
//                   //               borderRadius: BorderRadius.circular(10.0),
//                   //             ),
//                   //           ),
//                   //         ),
//                   //       ),
//                   //     ),
//                   //   ],
//                   // ),
//
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   // some changes
// }

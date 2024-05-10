import 'dart:async';
import 'dart:convert';
import 'package:ai_med_health/presentation/dashboard/dashboard_pages/home_page.dart';
import 'package:ai_med_health/presentation/dashboard/dashboard_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../consts/colors.dart';
import '../forgot/forgot.dart';
import 'registration.dart';

class LoginPage extends StatefulWidget {
  // final String fromScreen;
  // SignInPage({required this.fromScreen});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  String loggedInEmail = ''; // Declare loggedInEmail here
  bool _isPasswordVisible = false;
  String loggedInUserId = '';

  bool displayOTPController = true;
  String _inputText = '';

  bool _showOTPController = true;

  String? _selectedCountryCode;
  bool _isGenerateButtonDisabled = false;

  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> _signInWithGoogle() async {
    // Trigger Google Sign-In flow
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

    if (googleUser != null) {
      // Handle successful sign-in (e.g., navigate to a different screen)
      print('Signed in with Google ID: ${googleUser.id}');
      // Access additional user information (optional)
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final String? accessToken = googleAuth.accessToken;
      final String? idToken = googleAuth.idToken;
      print('Access Token: $accessToken');
      print('ID Token: $idToken');
    } else {
      print('Sign-in cancelled by user.');
    }
  }

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (Timer timer) {
      setState(() {
        if (_timer > 0) {
          _timer--;
        }
      });
    });
  }





  Widget _buildSignInLink() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 15,
          ),
          Container(
            child: GestureDetector(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => SignInPage()),
                // );
              },
              child: Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Text(
                  "Don't have an account?",
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Container(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegistrationPage()),
                );
              },
              child: Padding(
                padding: EdgeInsets.only(right: 0.0),
                child: Text(
                  'Sign up',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: bgColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  int _timer = 59;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor:lightBlue,
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              Container(
                child: Container(
                  // width: MediaQuery.of(context).size.width * 0.2,
                  // height: MediaQuery.of(context).size.height * 0.1,
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Image.asset('assets/images/login_img.png'),
                ),
              ),

              SizedBox(height: 15),

              Container(
                child: Text(
                  "Let's Sign in",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: lightBlack,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Text(
                  "Welcome Back, You've",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
              ),
              Container(
                child: Text(
                  "been missed!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
              ),

              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(child: Text("Email",style: TextStyle(color: lightBlack,fontWeight: FontWeight.w400),),),
                  SizedBox(height: 5,),
                  Container(
                    height: 65,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: TextField(
                      controller: _mobileController,
                      decoration: InputDecoration(
                        errorText: null,
                        hintText: 'abcd@gmail.com',
                        hintStyle: TextStyle(fontWeight: FontWeight.w400, color: Colors.black54),
                        prefixIcon: Icon(Icons.email,
                            color: Colors.black54),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 14.0, horizontal: 16.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 3.0),
                  Container(child: Text("Password",style: TextStyle(color: lightBlack,fontWeight: FontWeight.w400),),),
                  SizedBox(height: 5,),
                  Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: TextField(
                            controller: _otpController,
                            keyboardType: TextInputType.number,
                            style: TextStyle(
                              fontSize: 14,
                            ),
                            decoration: InputDecoration(
                              hintText: '********',
                              prefixIcon: Icon(Icons.lock,
                                  color: Colors.black54),
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.w400, color: Colors.black54, fontSize: 16),
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 14.0,
                                horizontal: 16.0,
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black, // Border color
                                  width: 1.0, // Border width
                                ),
                                borderRadius: BorderRadius.circular(10.0), // Border radius
                              ),
                            ),
                          ),
                        ),
                  SizedBox(
                    height: 10,
                  ),

                  // Align(
                  //   alignment: Alignment.topRight,
                  //   child: ElevatedButton(
                  //     onPressed: (displayOTPController &&
                  //             !_isGenerateButtonDisabled &&
                  //             !_isPasswordVisible)
                  //         ? () async {
                  //             final String mobileNumber =
                  //                 _mobileController.text;
                  //             // Call _generateAndSendOTP and wait for it to complete
                  //             // await _generateAndSendOTP(mobileNumber);
                  //
                  //             // Check if OTP was successfully sent before starting the timer
                  //             if (displayOTPController) {
                  //               // Disable the button and start the timer
                  //               setState(() {
                  //                 _isGenerateButtonDisabled = true;
                  //                 _timer = 60; // Reset the timer
                  //                 Timer.periodic(Duration(seconds: 1), (timer) {
                  //                   if (_timer == 0) {
                  //                     timer.cancel();
                  //                     setState(() {
                  //                       _isGenerateButtonDisabled = false;
                  //                     });
                  //                   } else {
                  //                     setState(() {
                  //                       _timer--;
                  //                     });
                  //                   }
                  //                 });
                  //               });
                  //             }
                  //
                  //             print(
                  //                 'Prefix Text: ${_selectedCountryCode ?? '91'}');
                  //           }
                  //         : null,
                  //     style: ElevatedButton.styleFrom(
                  //       foregroundColor: Colors.white,
                  //       backgroundColor: bgColor,
                  //       padding: EdgeInsets.symmetric(horizontal: 12.0),
                  //       shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(5),
                  //       ),
                  //     ),
                  //     child: Text('Generate OTP'),
                  //   ),
                  // ),
                  SizedBox(
                    height: 10,
                  ),
                  if (!_isPasswordVisible)
                    // Text(
                    //   _isGenerateButtonDisabled ? ' $_timer seconds' : '',
                    //   textAlign: TextAlign.center,
                    //   style: TextStyle(
                    //     color: Colors.white,
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),

                    SizedBox(
                      height: 20,
                    ),

                  Container(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      // onPressed: _performSignIn,
                      onPressed: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context) => DashboardScreen(),));
                        // Navigator.push(context,MaterialPageRoute(builder: (context) => HomePage(),));
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: bgColor,
                        padding: EdgeInsets.symmetric(vertical: 13.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),

                      ),
                      child: Text(
                        'Login',
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
                      ),
                    ),
                  ),
                  // Center(
                  //   child: TextButton(
                  //     onPressed: () {
                  //       // Navigator.push(
                  //       //   context,
                  //       //   MaterialPageRoute(
                  //       //     builder: (context) => EmailPage(),
                  //       //   ),
                  //       // );
                  //     },
                  //     child: Text(
                  //       "If you want sign In with email ? Click here",
                  //           style: TextStyle(
                  //             fontSize: 13,
                  //             color: bgColor
                  //           ),
                  //     ),
                  //   ),
                  // ),

                  SizedBox(
                    height: 20,
                  ),

                  Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ForgotPasswordPage()),
                          );
                        },
                        child: Text(
                          "Forgot Password?",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color:
                            bgColor, // Change color to match your design
                          ),
                        ),
                      ),
                      _buildSignInLink(),
                    ],
                  ),

                  SizedBox(
                    height: 60,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 80,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 0.5,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        child: Text("Or Continue with",
                            style: TextStyle(fontWeight: FontWeight.w500)),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 80,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 0.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Center(
                        child: Container(
                          height: 70,
                          width: 160,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2), // Color of the shadow
                                spreadRadius: 5, // Spread radius
                                blurRadius: 7, // Blur radius
                                offset: Offset(0, 3), // Offset in x and y directions
                              ),
                            ],
                          ),
                          child: ElevatedButton.icon(
                            // onPressed: _signInWithGoogle,
                            onPressed: (){},
                            icon: Icon(Icons.g_mobiledata_outlined, size: 40),
                            label: const Text('Google', style: TextStyle(fontSize: 16)),
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.black87,
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                      ),

                      Center(
                        child: Container(
                          height: 70,
                          width: 160,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2), // Color of the shadow
                                spreadRadius: 5, // Spread radius
                                blurRadius: 7, // Blur radius
                                offset: Offset(0, 3), // Offset in x and y directions
                              ),
                            ],
                          ),
                          child: ElevatedButton.icon(
                            onPressed: (){},
                            icon: Icon(Icons.facebook,size: 30,),
                            label: const Text('facebook', style: TextStyle(fontSize: 16)),
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.black87,
                              // backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

// Function to handle login response
  void handleLoginResponse(Map<String, dynamic> response) {
    // Check if the response indicates an error due to the use of OTP
    if (response['errorCod'] == 201) {
      setState(() {
        displayOTPController =
            false; // Hide OTP controller and display password field
      });
    }
  }

  Widget _buildBackButton() {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 0.0, 18.0, 9.0),
      // Adjust top padding here
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Container(
          padding: EdgeInsets.only(top: 8.0), // Adjust top padding for the Icon
          child: Icon(
            Icons.keyboard_arrow_left,
            color: Colors.blue,
            size: 30,
          ),
        ),
      ),
    );
  }

  // void _saveCountryCode(String countryCode) async {
  //   print('Selected country code: $countryCode'); // Print selected country code
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setString('countryCode', countryCode);
  //   setState(() {
  //     _countryCode =
  //         countryCode; // Update _countryCode with the selected country code
  //   });
  // }

  // some changes
}



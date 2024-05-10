import 'package:flutter/material.dart';

import '../../consts/colors.dart';
import '../authentication/registration.dart';
import 'verifyOtp.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _emailController = TextEditingController();

  String _enteredEmail = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBlue, // Set the background color here
      appBar: null,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60),
              // Align(
              //   alignment: Alignment.topLeft,
              //   child: GestureDetector(
              //     onTap: () {
              //       Navigator.pop(context); // Navigate back
              //     },
              //     child: Container(
              //       margin: EdgeInsets.only(left: 20, top: 15),
              //       padding: EdgeInsets.all(16.0),
              //       child: Icon(
              //         Icons.keyboard_arrow_left,
              //         size: 30,
              //         color: Colors.blue,
              //       ),
              //     ),
              //   ),
              // ),
              Container(
                child: Container(
                  // width: MediaQuery.of(context).size.width * 0.2,
                  // height: MediaQuery.of(context).size.height * 0.1,
                  margin: EdgeInsets.only(left: 10),
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Image.asset('assets/images/forgot_pass_img.png'),
                ),
              ),
              SizedBox(height: 15),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Text(
                  'Forgot Password',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87),
                ),
              ),

              SizedBox(height: 8), // Add spacing for subtext
              Container(
                margin: EdgeInsets.only(left: 10),
                width: 280,
                child: Text(
                  'We need your registration email account to send you password reset code!',
                  textAlign: TextAlign.left, // Align text to the left
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
              ),
              SizedBox(height: 30),

              Container(
                margin: EdgeInsets.only(left: 10),
                child: Text(
                  "Email",
                  style: TextStyle(color: lightBlack,fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(height: 5,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white,
                ),
                height: 55,
                margin: EdgeInsets.only(left: 10,right: 10),
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: 'abc@gmail.com',
                    hintStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black54),
                    prefixIcon: Icon(
                      Icons.email,
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
                height: 15,
              ),


              SizedBox(height: 320),

              Container(
                width: double.infinity,
                margin: EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: () async {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => OTPVerificationPage(),));
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: bgColor,
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    textStyle: TextStyle(
                      fontSize: 17.0,
                    ),
                  ),
                  child: Text(
                    'Next',
                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 17),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ForgotPasswordPage(),
                  ),
                );
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showSuccessDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Success'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

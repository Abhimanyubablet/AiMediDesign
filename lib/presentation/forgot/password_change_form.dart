import 'package:ai_med_health/presentation/authentication/login_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../consts/colors.dart';



class PasswordChangeForm extends StatefulWidget {
  final String email;

  PasswordChangeForm({required this.email});

  @override
  _PasswordChangeFormState createState() => _PasswordChangeFormState();
}

class _PasswordChangeFormState extends State<PasswordChangeForm> {
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController reEnterNewPasswordController = TextEditingController();

  bool _isUpdatingPassword = false;
  bool _obscureText = true;
  bool _hideText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBlue, // Set background color of Scaffold to blue
      body: Builder(
        builder: (BuildContext context) {
          return Container(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 40),
                      Container(
                        child: Container(
                          // width: MediaQuery.of(context).size.width * 0.2,
                          // height: MediaQuery.of(context).size.height * 0.1,
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Image.asset('assets/images/reset_password_img.png'),
                        ),
                      ),
                      SizedBox(height: 15),

                      Text(
                        'Reset Password',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      SizedBox(height: 15),
                      Text(
                        'Enter a new Password',
                        style: TextStyle(fontSize: 16,color: Colors.black54),
                      ),
                      SizedBox(height: 15),
                      Container(
                        child: Text(
                          "New Password",
                          style: TextStyle(color: lightBlack,fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(height: 5,),
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white, // Set background color to white
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: TextFormField(
                          controller: newPasswordController,
                          obscureText: _hideText,
                          decoration: InputDecoration(
                              hintText: '********',
                              hintStyle: TextStyle(fontSize: 16, fontWeight:FontWeight.w400,color: Colors.black54),
                              prefixIcon: Icon(
                                Icons.lock_reset,
                                color: Colors.black54,
                              ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _hideText
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.black54,
                              ),
                              onPressed: () {
                                setState(() {
                                  _hideText = !_hideText;
                                });
                              },
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
                      SizedBox(height: 16),
                      Container(
                        child: Text(
                          "Confirm Password",
                          style: TextStyle(color: lightBlack,fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(height: 5,),
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white, // Set background color to white
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: TextFormField(
                          controller: reEnterNewPasswordController,
                          obscureText: _obscureText,
                          decoration: InputDecoration(
                            hintText: '********',
                              hintStyle: TextStyle(fontSize: 16, fontWeight:FontWeight.w400,color: Colors.black54),
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Colors.black54,
                              ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.black54,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
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
                      // SizedBox(height: 10),
                      // Text(
                      //   'Please enter a new password into the fields below:\n'
                      //   '1) Your password must have at least 8 characters.\n'
                      //   '2) Must contain at least one upper case letter, one lower case letter, one number, and one special character (ex: %, @, #).\n'
                      //   '3) Passwords cannot contain < or >.',
                      //   style: TextStyle(
                      //     color: Colors.black54,
                      //     fontSize: 12,
                      //   ),
                      // ),
                      SizedBox(height: 300),
                      // Container(
                      //   height: 55,
                      //   width: double.infinity,
                      //   child: ElevatedButton(
                      //     onPressed:
                      //         _isUpdatingPassword ? null : _updatePassword,
                      //     child: _isUpdatingPassword
                      //         ? Container(
                      //             child: CircularProgressIndicator(
                      //               strokeWidth: 5,
                      //               valueColor: AlwaysStoppedAnimation<Color>(
                      //                   Colors.white),
                      //             ),
                      //           )
                      //         : Text(
                      //             'Submit',
                      //             style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold),
                      //           ),
                      //     style: ButtonStyle(
                      //       backgroundColor:
                      //           MaterialStateProperty.all<Color>(bgColor),
                      //       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      //         RoundedRectangleBorder(
                      //           borderRadius: BorderRadius.circular(10.0),
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),

                      Container(
                        height: 55,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(),));
                          },
                             child:  Text(
                            'Submit',
                            style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold),
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.all<Color>(bgColor),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _updatePassword() async {
    String newPassword = newPasswordController.text;
    String reEnterNewPassword = reEnterNewPasswordController.text;

    if (!_isValidPasswordChange()) {
      _showPasswordRequirementsPopup(context);
      return;
    }

    setState(() {
      _isUpdatingPassword = true;
    });

    final url =
        Uri.parse('https://smartmed.co.in:3000/api/user/update-password');
    final headers = {'Content-Type': 'application/json'};
    final requestBody = {
      'email': widget.email,
      'password': newPassword,
    };
    final requestBodyJson = jsonEncode(requestBody);

    try {
      final response = await http.post(
        url,
        headers: headers,
        body: requestBodyJson,
      );

      if (response.statusCode == 201) {
        final responseBody = json.decode(response.body);
        if (responseBody.containsKey('errorCode') &&
            responseBody['errorCode'] == 0) {
          print('Password updated successfully');
          _showSuccessDialog(responseBody['message']);
        } else {
          print('Password update failed: ${responseBody['message']}');
        }
      } else {
        print('Failed to update password. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error updating password: $e');
    }

    setState(() {
      _isUpdatingPassword = false;
    });
  }

  bool _isValidPasswordChange() {
    String newPassword = newPasswordController.text;
    String reEnterNewPassword = reEnterNewPasswordController.text;

    if (newPassword.isEmpty || reEnterNewPassword.isEmpty) {
      print('Please fill all the fields');
      return false;
    }

    if (newPassword != reEnterNewPassword) {
      print('New Passwords do not match');
      return false;
    }

    if (!_isStrongPassword(newPassword)) {
      print('Password does not meet the requirements');
      return false;
    }

    return true;
  }

  bool _isStrongPassword(String password) {
    final RegExp passwordRegExp = RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
    );

    return passwordRegExp.hasMatch(password) &&
        !_containsInvalidCharacters(password);
  }

  bool _containsInvalidCharacters(String password) {
    final RegExp invalidCharactersRegExp = RegExp(r'[<>]');

    return invalidCharactersRegExp.hasMatch(password);
  }

  void _showPasswordRequirementsPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Password Requirements'),
          content: Text(
            'Please make sure your password meets the following requirements:\n'
            '1) Your password must have at least 8 characters.\n'
            '2) Must contain at least one upper case letter, one lower case letter, one number, and one special character (ex: %, @, #).\n'
            '3) Passwords cannot contain < or >.',
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
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
          title: Text('Your password has been reset'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
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
}

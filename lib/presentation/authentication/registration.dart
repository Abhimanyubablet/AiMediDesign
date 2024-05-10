import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../consts/colors.dart';
import '../../domain/common_fuction_api.dart';
import 'congrats_page.dart';
import 'login_page.dart';


class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  String _inputText = '';
  String? _selectedUserType; // Declare this variable for the selected user type
  List<String> _userTypes = [
    'Pharmacy',
    'User/Patient',
    'Pathology',
    'Hospital'
  ]; // Provide your list of user types
  bool _isValidMobile = true; // Variable to track mobile number validity

  Future<void> postData() async {
    String endpoint = 'user/create';

    Map<String, String> headers = {
      'accept': '*/*',
      'Content-Type': 'application/json',
    };

    final requestData = {
      "full_name": _firstNameController.text,
      "email_id": _emailController.text,
      "country_code": "+91",
      "mobile_no": _inputText,
      "status": true,
      "password": _passwordController.text,
      "user_type": _selectedUserType!,

    };

    String body = jsonEncode(requestData);

    try {
      var responseBody = await post(endpoint, headers: headers, body: body);
      print('Response body: $responseBody');
      _showSnackBar('Registration Successfull');
      Navigator.push(context, MaterialPageRoute(builder: (context) => CongratsPage(),));

    } catch (e) {
      // Handle errors
      print('Error: $e');
    }
  }



  @override
  void initState() {
    super.initState();
    //checkLoginStatus();
  }


  bool _isPasswordVisible = false;

  Widget _buildRegistrationForm() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            _buildHeader(),
            SizedBox(height: 15),
             Container(
               child: Text("Name *",style: TextStyle(color: lightBlack,fontWeight: FontWeight.w400),),
             ),
            SizedBox(height: 5),
            _buildTextField(
              controller: _firstNameController,
              hintText: 'Abc Singh',
              prefixIcon: Icons.person,
              iconColor: Colors.black54,
              backgroundColor: Colors.white,
            ),
            SizedBox(height: 5),
            Container(
              child: Text("Email *",style: TextStyle(color: lightBlack,fontWeight: FontWeight.w400),),
            ),
            SizedBox(height: 5),

            _buildTextField(
              controller: _emailController,
              hintText: 'abc@gmail.com',
              prefixIcon: Icons.email,
              iconColor: Colors.black54,
              backgroundColor: Colors.white, // Set background color here
              isValid: _isValidEmail(),
            ),
            SizedBox(height: 5),

            Container(
              child: Text("User Type *",style: TextStyle(color: lightBlack,fontWeight: FontWeight.w400),),
            ),
            SizedBox(height: 5),
            Container(
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: DropdownButtonFormField<String>(
                value: _selectedUserType,
                onChanged: (newValue) {
                  setState(() {
                    _selectedUserType = newValue;
                  });
                },
                items: _userTypes.map((userType) {
                  return DropdownMenuItem<String>(
                    value: userType,
                    child: Text(userType),
                  );
                }).toList(),
                decoration: InputDecoration(
                  hintText: 'Pharmacy',
                  hintStyle: TextStyle(color: lightBlack,fontWeight: FontWeight.w400),
                  prefixIcon: Icon(
                    Icons.category,
                    color: Colors.black54,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(height: 5),

            Container(
              child: Text("Mobile Number *",style: TextStyle(color: lightBlack,fontWeight: FontWeight.w400),),
            ),

            SizedBox(height: 5),

            Container(
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: IntlPhoneField(
                controller: _mobileController,
                decoration: InputDecoration(
                  hintText: '926292xxxx',
                  hintStyle:
                  TextStyle(fontWeight: FontWeight.w400, color: Colors.black54),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                onChanged: (phone) {
                  setState(() {
                    _inputText = phone.completeNumber;
                  });
                  // _saveCountryCode(phone.countryCode!); // Save country code
                },
              ),
            ),

            Container(
              child: Text("Password *",style: TextStyle(color: lightBlack,fontWeight: FontWeight.w400),),
            ),
            SizedBox(height: 5),
            _buildPasswordField(),

            _buildSignUpButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 15),
        Image.asset(
          'assets/images/add-user.png', // Replace with your icon asset path
          width: 50, // Adjust the width as needed
          height: 50, // Adjust the height as needed
        ),
        SizedBox(height: 8),
        Text(
          "Getting Started",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18,
            fontFamily:"assets/fonts/regular.ttf"
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Create an account to continue!',
          style: TextStyle(fontSize: 16, color: Colors.black54),
        ),
      ],
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    TextInputType? keyboardType,
    int? maxLength,
    ValueChanged<String>? onChanged,
    bool? isValid,
    bool isRequired = true,
    IconData? prefixIcon,
    Color? backgroundColor,
    Color? iconColor,
  }) {
    bool? _isTouched = false;

    final errorText =
        (isRequired && (_isTouched ?? false) && controller.text.isEmpty)
            ? 'This field is required'
            : null;

    return Container(
      height: 55,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(fontWeight: FontWeight.w400, color: Colors.black54),
          errorText: errorText,
          prefixIcon: prefixIcon != null
              ? Icon(prefixIcon, color: iconColor)
              : null, // Adding prefix icon
          suffixIcon: isValid == null
              ? null
              : isValid
                  ? Icon(
                      Icons.check,
                      color: Colors.purple,
                    )
                  : Icon(
                      Icons.error,
                      color: Colors.red,
                    ),
          contentPadding:
              EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black, // Border color
              width: 1.0, // Border width
            ),
            borderRadius: BorderRadius.circular(10.0), // Border radius
          ),
        ),
        keyboardType: keyboardType,
        maxLength: maxLength,
        onChanged: onChanged,
        onSubmitted: (value) {
          // Update the touched state
          if (!_isTouched!) {
            _isTouched = true;
            // Trigger a rebuild
            setState(() {});
          }
        },
      ),
    );
  }

  Widget _buildPasswordField() {
    final password = _passwordController.text;
    String? errorText;

    if (password.isNotEmpty) {
      final passwordRegex = RegExp(
        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[%@$#])[a-zA-Z0-9%@$#]{8,}$',
      );

      if (!passwordRegex.hasMatch(password)) {
        errorText = 'Password must:'
            'Maintain the format below';
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 55,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: TextField(
            controller: _passwordController,
            decoration: InputDecoration(
              hintText: 'Abhi@123',
              hintStyle: TextStyle(
                fontWeight: FontWeight.w400,
                color: Colors.black54,
              ),
              prefixIcon: Icon(Icons.lock,
                  color: Colors.black54), // Add prefix icon here
              // Display the error message
              suffixIcon: IconButton(
                icon: Icon(
                  _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  });
                },
              ),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),


              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black, // Border color
                  width: 1.0, // Border width
                ),
                borderRadius: BorderRadius.circular(10.0), // Border radius
              ),


            ),
            obscureText: !_isPasswordVisible,
          ),
        ),
        SizedBox(height: 10), // Add space here
        Visibility(
          visible: errorText != null,
          child: Text(
            errorText.toString(),
            style: TextStyle(
              color: Colors.red,
              fontSize: 12,
            ),
          ),
        ),

        SizedBox(height: 10), // Add space here

      ],
    );
  }

  Widget _buildSignUpButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        // onPressed: _completeRegistration,
        onPressed: (){
          Navigator.push(context,MaterialPageRoute(builder: (context) => CongratsPage(),));
          // postData();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        child: const Text(
          'Create Account',
          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),
        ),
      ),
    );
  }

  bool? _isValidEmail() {
    final email = _emailController.text;
    if (email.isEmpty) {
      return null; // Email is optional
    }
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    return emailRegex.hasMatch(email);
  }

  bool _isValidPassword() {
    final password = _passwordController.text;

    final passwordRegex = RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[%@#$])[a-zA-Z0-9%@#$]{8,}$',
    );

    return passwordRegex.hasMatch(password);
  }



  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }



  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(


      backgroundColor: lightBlue,

      body: Container(
        child: Padding(
          padding: EdgeInsets.all(14.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildRegistrationForm(),
                  SizedBox(height: 7,),
                  _buildSignInLink(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


  Widget _buildSignInLink() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Text(
                  'Already have an account?',
                  style: TextStyle(
                    color: Colors.black45,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Container(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Padding(
                padding: EdgeInsets.only(right: 16.0),
                child: Text(
                  ' Sign In ',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: bgColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


}


import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rto_app/Screens/Auth/login.dart';
import 'package:rto_app/Screens/Dashboard/home.dart';
import 'package:rto_app/Widgets/Custom Button/custom_button.dart';
import 'package:rto_app/Widgets/Custom%20Appbar/custom_appbar.dart';
import '../../Widgets/Custom Textfield/custom_textfield.dart';
import '../SharedPreference/SharePref.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: "RTO Registration", centerTitle: true),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Center(
            child: Column(
              children: [
                 SizedBox(height: 50),
                Image.asset('assets/logo.png'),

                // Name Field
                Padding(
                  padding:  EdgeInsets.all(12),
                  child: CustomTextfield(
                    controller: name,
                    keyboardType: TextInputType.name,
                    preFixIcon:  Icon(Icons.drive_file_rename_outline),
                    hintText: 'Enter Your Name',
                  ),
                ),

                // Email Field
                Padding(
                  padding:  EdgeInsets.all(12),
                  child: CustomTextfield(
                    controller: email,
                    keyboardType: TextInputType.emailAddress,
                    preFixIcon:  Icon(Icons.email),
                    hintText: 'Enter Email Address',
                  ),
                ),

                // Password Field
                Padding(
                  padding:  EdgeInsets.all(12),
                  child: CustomTextfield(
                    controller: password,
                    keyboardType: TextInputType.visiblePassword,
                    preFixIcon:  Icon(Icons.password),
                    hintText: 'Enter Password',
                  ),
                ),

                // Register Button
                Padding(
                  padding:  EdgeInsets.all(12),
                  child: CustomButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        register(
                          name.text.trim(),
                          email.text.trim(),
                          password.text.trim(),
                        );
                      }
                    },
                    child:  Text(
                      "Register",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                // Login Button
                Padding(
                  padding:  EdgeInsets.all(12),
                  child: CustomButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) =>  Login()),
                      );
                    },
                    child:  Text(
                      "Do You Already Registered? Login",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
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

  // Register Function
  Future<void> register(String regName, String regEmail, String regPassword) async {
    var url = Uri.parse("https://www.prakrutitech.xyz/abhay/a_add_user.php");

    try {
      var resp = await http.post(
        url,
        body: {
          "name": regName,
          "email": regEmail,
          "password": regPassword,
        },
      );

      var data = jsonDecode(resp.body);

      if (data == 0) {
        print("Registration Failed");
      } else {
        // Save user info using SharedPref
        await SharedPref.saveLoginStatus(true);
        await SharedPref.saveUserEmail(regEmail);
        await SharedPref.saveUserName(regName);

        print("Registration Successful");

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) =>  Home()),
        );
      }
    } catch (e) {
      print("Error during registration: $e");
    }
  }
}
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// import 'package:rto_app/Screens/Auth/register.dart';
import 'package:rto_app/Screens/Dashboard/home.dart';
import 'package:rto_app/Screens/Permission/permission.dart';
import 'package:rto_app/Widgets/Custom%20Appbar/custom_appbar.dart';
import 'package:rto_app/Widgets/Custom%20Button/custom_button.dart';
import 'package:rto_app/Widgets/Custom%20Textfield/custom_textfield.dart';
import '../SharedPreference/SharePref.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController email = TextEditingController();
  final TextEditingController pass = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  // Check if user is already logged in
  void checkLoginStatus() async {
    bool loggedIn = await SharedPref.getLoginStatus();
    if (loggedIn) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
    } else {
      setState(() {
        isLoading = false; // show login screen
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return  Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: CustomAppbar(title: "RTO Login", centerTitle: true),
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 50),
                Image.asset('assets/logo.png'),

                // Email Field
                Padding(
                  padding: EdgeInsets.all(12),
                  child: CustomTextfield(
                    controller: email,
                    keyboardType: TextInputType.emailAddress,
                    preFixIcon: Icon(Icons.email),
                    hintText: 'Enter Email Address',
                  ),
                ),

                // Password Field
                Padding(
                  padding: EdgeInsets.all(12),
                  child: CustomTextfield(
                    controller: pass,
                    keyboardType: TextInputType.visiblePassword,
                    preFixIcon: Icon(Icons.password),
                    hintText: 'Enter Password',
                  ),
                ),

                // Login Button
                Padding(
                  padding: EdgeInsets.all(12),
                  child: CustomButton(
                    onPressed: () {
                      if (_formkey.currentState!.validate())
                      {
                        login(email.text.toString().trim(), pass.text.toString().trim());
                      }
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),

                // Register Button
                Padding(
                  padding: EdgeInsets.all(12),
                  child: CustomButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Permission()),
                      );
                    },
                    child: Text(
                      "Don't have an account? Register",
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

  // Login Function
  Future<void> login(String mail, String password) async {
    var url = Uri.parse("https://www.prakrutitech.xyz/abhay/a_login_user.php");

    try {
      var resp = await http.post(
        url,
        body: {"email": mail, "password": password}
      );

      var data = jsonDecode(resp.body);
      if (data['success'] == false) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(data['message'] ?? "Login Failed")),
        );
      }
      else
      {
        // Save login status and email using SharedPref
        await SharedPref.saveLoginStatus(true);
        await SharedPref.saveUserEmail(mail);

        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Login Successful")));

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Error")));
    }
  }
}
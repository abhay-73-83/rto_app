import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:rto_app/Screens/Splash/splash.dart';
import 'package:rto_app/Widgets/Custom%20Button/custom_button.dart';

class ConnectivityErrorScreen extends StatefulWidget {
  const ConnectivityErrorScreen({super.key});

  @override
  State<ConnectivityErrorScreen> createState() => _ConnectivityErrorScreenState();
}

class _ConnectivityErrorScreenState extends State<ConnectivityErrorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/no_internet.json',
              width: 250,
              height: 250,
              repeat: true,
            ),
            Text(
              '\t\t \tOOPS! \nNo Internet',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            CustomButton(
              onPressed: () async {
                var connectivityResult = await Connectivity().checkConnectivity();

                if (connectivityResult != ConnectivityResult.none) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Splash()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Still no internet connection")),
                  );
                }
              },
              child: Text("Retry", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}

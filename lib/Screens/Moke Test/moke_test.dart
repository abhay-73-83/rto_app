import 'package:flutter/material.dart';
import 'package:rto_app/Screens/Dashboard/Exam.dart';
import 'package:rto_app/Widgets/Custom%20Button/custom_button.dart';
import '../../Widgets/Attempt Moke Test/attempts.dart';
import '../../Widgets/Custom Appbar/custom_appbar.dart';

class MokeTest extends StatelessWidget {
  const MokeTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: CustomAppbar(title: 'Test', centerTitle: true),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                "https://images.bhaskarassets.com/web2images/1884/2025/01/30/4_1738222721.gif",
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                StatItem(title: "Attempts", value: "1", color: Colors.orange),
                StatItem(title: "Passed", value: "0", color: Colors.green),
                StatItem(title: "Failed", value: "1", color: Colors.red),
              ],
            ),

            SizedBox(height: 25),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: CustomButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Exam()));
                },
                child: Text(
                  "Start Test",
                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            SizedBox(height: 30),

            Text(
              "Test Instructions :",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 10),

            Text(
              "1. 48 seconds will be given for each question.\n"
              "2. Passing score for the test is 11 out of 15.\n"
              "3. 3 consecutive wrong answers will be considered as failed.\n"
              "4. Any 5 wrong answers will be considered as failed.",
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:rto_app/Screens/Dashboard/question.dart';
import 'package:rto_app/Screens/FAQ/faqs.dart';
import 'package:rto_app/Screens/Moke%20Test/moke_test.dart';
import 'package:rto_app/Screens/Vehicle%20Population/vehicle_population.dart';
import 'package:rto_app/Widgets/App%20Colors/AppColors.dart';
import 'package:rto_app/Widgets/Custom%20Appbar/custom_appbar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Auth/login.dart';
import '../Process Of License/processOfLicense.dart';
import '../RTO Offices/rto_offices.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {

    void _logout() async {
      final prefs = await SharedPreferences.getInstance();
      await prefs.clear();

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Login())
      );
    }
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: 'Dashboard', centerTitle: true,
      action: [
        IconButton(onPressed: _logout, icon: Icon(Icons.logout))
      ],),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: 9,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 4,
            mainAxisSpacing: 4,
            childAspectRatio: 0.75,
          ),
          itemBuilder: (context, index) {
            final cards = [
              {
                'title': 'Learn',
                'image': 'assets/learn.png',
              },
              {
                'title': 'Practice',
                'image': 'assets/practice.png',
              },
              {
                'title': 'Moke Test',
                'image': 'assets/mock test.png',
              },
              {
                'title': 'Marked For Revision',
                'image': 'assets/marked for revision.png',
              },
              {
                'title': 'RTO Offices',
                'image': 'assets/rto office.png',
              },
              {
                'title': 'Process',
                'image': 'assets/process.png',
              },
              {
                'title': 'Statistics',
                'image': 'assets/statistic.png',
              },
              {
                'title': 'Forms',
                'image': 'assets/form.png',
              },
              {
                'title': 'FAQ',
                'image': 'assets/faq.png',
              },
            ];

            return GestureDetector(
              onTap: () {
                if (index == 0) {

                }
                if (index == 1) {
                  Navigator.push(context,MaterialPageRoute(builder: (context) => QuestionBankScreen()));
                }
                if (index == 2) {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => Exam()));
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MokeTest()));
                }
                if (index == 3) {

                }
                if (index == 4) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => RtoOffices()));
                }
                if (index == 5) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ProcessOfLicense()));
                }
                if (index == 6) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => VehiclePopulation()));
                }
                if (index == 7) {

                }
                if (index == 8) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => FAQS()));
                }
              },
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Image.asset(
                          height: 50,width: 50,
                          cards[index]['image']!,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Text(
                        cards[index]['title']!,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
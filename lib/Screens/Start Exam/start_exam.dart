import 'package:flutter/material.dart';
import '../../Widgets/Custom Appbar/custom_appbar.dart';

class StartExam extends StatefulWidget {
  const StartExam({super.key});

  @override
  State<StartExam> createState() => _StartExamState();
}

class _StartExamState extends State<StartExam> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'Start Exam', centerTitle: true),
      body: Padding(padding: EdgeInsets.all(12),
        child: Column(
          children: [

          ],
        ),),
    );
  }
}
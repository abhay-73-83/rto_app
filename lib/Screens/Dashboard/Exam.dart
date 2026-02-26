import 'package:flutter/material.dart';
import 'package:rto_app/Screens/Exam Details/exam_details.dart';
import 'package:rto_app/Widgets/Custom Appbar/custom_appbar.dart';

class Exam extends StatefulWidget {
  const Exam({super.key});

  @override
  State<Exam> createState() => _ExamState();
}

class _ExamState extends State<Exam> {
  final List<Map<String, String>> _categoryList = [
    {
      'name': 'MCWOG',
      'description':
      'Motorcycle without Gear: Gearless motorcycles like scooters and mopeds.',
    },
    {
      'name': 'MCWG',
      'description':
      'Motorcycle with Gear: Standard motorcycles requiring gear shifts.',
    },
    {
      'name': 'LMV',
      'description':
      'Light Motor Vehicle: Passenger cars, jeeps, and vans under 3,500 kg.',
    },
    {
      'name': 'HMV',
      'description':
      'Heavy Motor Vehicle: Vehicles for goods or large passenger transport.',
    },
    {
      'name': 'TR',
      'description':
      'Transport Vehicle: Commercial use vehicles for goods/passengers.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'Exam', centerTitle: true),
      body: Padding(
        padding: EdgeInsets.only(top: 15),
        child: ListView.builder(
          itemCount: _categoryList.length,
          itemBuilder: (context, index) {
            final category = _categoryList[index];
            return ListTile(
              title: Text(
                category['name']!,
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 18),
              ),
              subtitle: Text(category['description']!),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ExamDetails(),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
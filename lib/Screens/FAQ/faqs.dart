import 'package:flutter/material.dart';
import 'package:rto_app/Widgets/Custom%20Appbar/custom_appbar.dart';

class FAQS extends StatelessWidget {

  final List<String> faqItems = [
    "Learning Licence",
    "Driving Licence",
    "Registration of Vehicle",
    "Fitness of Vehicle",
    "Permit",
    "PUC",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: CustomAppbar(title: "FAQ", centerTitle: true),
      body: ListView.separated(
        itemCount: faqItems.length,
        separatorBuilder: (context, index) => Divider(height: 1),
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Color(0xFF3F5165),
              child: Icon(
                Icons.question_mark,
                color: Colors.white,
              ),
            ),
            title: Text(
              faqItems[index],
              style: TextStyle(fontSize: 16),
            ),
            onTap: () {
              print(faqItems[index]);
            },
          );
        },
      ),
    );
  }
}
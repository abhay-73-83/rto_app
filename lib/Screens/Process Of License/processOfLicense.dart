import 'package:flutter/material.dart';
import 'package:rto_app/Widgets/Custom%20Appbar/custom_appbar.dart';

class ProcessOfLicense extends StatelessWidget {

  final List<String> menuItems = [
    "New Driving License",
    "Addition of another category in the existing driving license",
    "Renewal of Driving License",
    "For change in details of driving license or obtaining a duplicate",
    "International Driving License or Permit",
    "Driving Licenses delivered",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: "Process of Driving License Services", centerTitle: true),
      body: ListView.separated(
        itemCount: menuItems.length,
        separatorBuilder: (context, index) => Divider(height: 1),
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.refresh),
            title: Text(
              menuItems[index],
              style: TextStyle(fontSize: 16),
            ),
            onTap: () {},
          );
        },
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:rto_app/Widgets/Custom%20Appbar/custom_appbar.dart';

class VehiclePopulation extends StatelessWidget {

  final List<Map<String, String>> vehicleData = [
    {
      "sr": "1",
      "year": "2000-2001",
      "transport": "826046",
      "nonTransport": "4749994",
      "total": "5576040"
    },
    {
      "sr": "2",
      "year": "2001-2002",
      "transport": "858113",
      "nonTransport": "5149856",
      "total": "6007969"
    },
    {
      "sr": "3",
      "year": "2002-2003",
      "transport": "899284",
      "nonTransport": "5609086",
      "total": "6508370"
    },
    {
      "sr": "4",
      "year": "2003-2004",
      "transport": "951943",
      "nonTransport": "6135597",
      "total": "7087540"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: "Statistics", centerTitle: true),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          child: DataTable(
            columns: [
              DataColumn(label: Text("Sr No")),
              DataColumn(label: Text("Year")),
              DataColumn(label: Text("Transport")),
              DataColumn(label: Text("Non Transport")),
              DataColumn(label: Text("Total")),
            ],
            rows: vehicleData.map((data) {
              return DataRow(cells: [
                DataCell(Text(data["sr"]!)),
                DataCell(Text(data["year"]!)),
                DataCell(Text(data["transport"]!)),
                DataCell(Text(data["nonTransport"]!)),
                DataCell(Text(data["total"]!)),
              ]);
            }).toList(),
          ),
        ),
      ),
    );
  }
}
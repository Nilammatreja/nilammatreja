import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final int roomNumber;
  final List<String> adultNames;
  final List<int> adultAges;
  final List<String> childNames;
  final List<int> childAges;

  DetailScreen({
    required this.roomNumber,
    required this.adultNames,
    required this.adultAges,
    required this.childNames,
    required this.childAges,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Room No: $roomNumber',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Adults:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            for (int i = 0; i < adultNames.length; i++)
              Text('${adultNames[i]}, Age: ${adultAges[i]}'),
            SizedBox(height: 16),
            Text(
              'Children:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            for (int i = 0; i < childNames.length; i++)
              Text('${childNames[i]}, Age: ${childAges[i]}'),
          ],
        ),
      ),
    );
  }
}
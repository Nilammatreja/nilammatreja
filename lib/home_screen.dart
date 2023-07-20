// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:nilammatreja/detail_screen.dart';


class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int roomNumber = 1;
  int adultNumber = 0;
  int childNumber = 0;
  List<String> adultNames = [];
  List<String> childNames = [];
  List<int> adultAges = [];
  List<int> childAges = [];

  void _submitForm() {
    print("roomNumber : ${roomNumber}");
    print("adultNames : ${adultNames}");
    print("adultAges : ${adultAges}");
    print("childNames : ${childNames}");
    print("childAges : ${childAges}");
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailScreen(
          roomNumber: roomNumber,
          adultNames: adultNames,
          adultAges: adultAges,
          childNames: childNames,
          childAges: childAges,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Room Booking'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Room Number:',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              DropdownButton<int>(
                value: roomNumber,
                onChanged: (int? newValue) {
                  setState(() {
                    roomNumber = newValue!;
                  });
                },
                items: [1, 2, 3, 4, 5].map<DropdownMenuItem<int>>((int value) {
                  return DropdownMenuItem<int>(
                    value: value,
                    child: Text('Room $value'),
                  );
                }).toList(),
              ),
              SizedBox(height: 16),
              Text(
                'Adult Number:',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              TextFormField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    adultNumber = int.parse(value);
                  });
                },
              ),
              SizedBox(height: 16),
              Text(
                'Child Number:',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              TextFormField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    childNumber = int.parse(value);
                  });
                },
              ),
              SizedBox(height: 24),
              Text(
                'Adult Details:',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              for (int i = 0; i < adultNumber; i++)
                _buildPersonDetails(i, 'Adult'),
              SizedBox(height: 24),
              Text(
                'Child Details:',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              for (int i = 0; i < childNumber; i++)
                _buildPersonDetails(i, 'Child'),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPersonDetails(int index, String type) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$type ${index + 1}'),
        SizedBox(height: 8),
        TextFormField(
          decoration: InputDecoration(labelText: 'Name'),
          onChanged: (value) {
            if (type == 'Adult') {
              setState(() {
                if (adultNames.length <= index)
                  adultNames.add(value);
                else
                  adultNames[index] = value;
              });
            } else {
              setState(() {
                if (childNames.length <= index)
                  childNames.add(value);
                else
                  childNames[index] = value;
              });
            }
          },
        ),
        SizedBox(height: 8),
        TextFormField(
          decoration: InputDecoration(labelText: 'Age'),
          keyboardType: TextInputType.number,
          onChanged: (value) {
            int age = int.parse(value);
            if (type == 'Adult') {
              if (age > 18) {
                setState(() {
                  if (adultAges.length <= index)
                    adultAges.add(age);
                  else
                    adultAges[index] = age;
                });
              } else {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Error'),
                    content: Text('Age should be above 18 for adults.'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('OK'),
                      ),
                    ],
                  ),
                );
              }
            } else {
              if (age < 18) {
                setState(() {
                  if (childAges.length <= index)
                    childAges.add(age);
                  else
                    childAges[index] = age;
                });
              } else {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Error'),
                    content: Text('Age should be below 18 for children.'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('OK'),
                      ),
                    ],
                  ),
                );
              }
            }
          },
        ),
        SizedBox(height: 16),
      ],
    );
  }
}



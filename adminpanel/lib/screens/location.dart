import 'package:adminpanel/controller/admincontroller.dart';
import 'package:flutter/material.dart';

class Locationadd extends StatefulWidget {
  const Locationadd({super.key, required this.location, this.userIndex});
  final int? userIndex;
  final TextEditingController location;

  @override
  State<Locationadd> createState() => _LocationaddState();
}

class _LocationaddState extends State<Locationadd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Add Location',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                hintText: 'List Of Locations',
                border: OutlineInputBorder(),
              ),
              items: <String>[
                'kasargod',
                'kannur',
                'Wayanad',
                'kozhikode',
                'malappuram',
                'palakkad',
                'thrissur',
                'ekm',
                'idukki',
                'kollam',
                'tvm'
              ].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (newValue) {
                widget.location.text = newValue!;
              },
            ),
            SizedBox(height: 35),
            Center(
              child: Container(
                height: 50,
                width: 175,
                decoration: BoxDecoration(
                  color: const Color(0xff0B8FAC),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: TextButton(
                  onPressed: () {
                    if (widget.userIndex != null) {
                      addmorelocations(
                          userIndex: widget.userIndex!,
                          location: widget.location.text,
                          context: context);
                    }
                    totallocation();
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Add',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

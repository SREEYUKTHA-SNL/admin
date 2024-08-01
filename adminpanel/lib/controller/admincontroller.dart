import 'package:adminpanel/screens/add.dart';
import 'package:flutter/material.dart';

List<Map<String, dynamic>> admin = [];

void adduser(
    {required Map<String, dynamic> details, required BuildContext context}) {
  final existingUsers = admin
      .where(
        (user) => user['username'] == details['username'],
      )
      .toList();

  if (existingUsers.isEmpty) {
    admin.add(details);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Added(),
        ));
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('User already exists'),
        duration: Duration(seconds: 4),
      ),
    );
  }
    }

void editdetails(
    {required Map<String, dynamic> edituser,
    required int index,
    required BuildContext context}) {
  admin[index] = edituser;
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Added(),
      ));
}

void removeDetails(int index) {
  if (index < admin.length) {
    admin.removeAt(index);
  }
}

void removeLocation(int index, int userIndex) {
  admin[userIndex]['location'].removeAt(index);
}

void addmorelocations(
    {required int userIndex,
    required String location,
    required BuildContext context}) {
  List<String> locations = List<String>.from(admin[userIndex]['location']);

  if (!locations.contains(location)) {
    admin[userIndex]['location'].add(location);
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('This location already exists'),
        duration: Duration(seconds: 2),
      ),
    );
  }
}

ValueNotifier<num> totalCount =ValueNotifier(0);
void totallocation(){

num  count=0;
  admin.forEach((element) {
    count = count + element['location'].length;

   });
  totalCount.value = count;
  


}

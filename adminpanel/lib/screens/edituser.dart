import 'package:adminpanel/controller/admincontroller.dart';
import 'package:adminpanel/screens/add.dart';
import 'package:adminpanel/screens/location.dart';
import 'package:adminpanel/widgets/textfield.dart';
import 'package:flutter/material.dart';

class Edit extends StatelessWidget {
  Edit({super.key, required this.isAdd, this.index});
  final bool isAdd;
  final int? index;

  final TextEditingController username = TextEditingController();
  final TextEditingController location = TextEditingController();
  final TextEditingController useremail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(
          'Add/Edit User',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('   User name'),
              Textfieldwidget(
                controller: username,
                text: 'Add username',
              ),
              Text('   User Email'),
              Textfieldwidget(
                controller: useremail,
                text: 'Add user email',
              ),
              Text('   User Location'),
              Textfieldwidget(
                controller: location,
                text: 'Add user Location',
                iconButton: IconButton(
                  icon: Icon(Icons.open_in_new),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            Locationadd(location: location,
                             userIndex: index),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 35),
              Center(
                child: Container(
                  height: 60,
                  width: 255,
                  decoration: BoxDecoration(
                    color: const Color(0xff0B8FAC),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: TextButton(
                    onPressed: () {
                     if (isAdd) {
                        adduser(context: context, details: {
                          'username': username.text ,
                          'useremail': useremail.text ,
                          'location': [location.text]
                        });
                      } else {
                        editdetails(
                            context: context,
                            edituser: {
                              'username': username.text ,
                              'useremail': useremail.text ,
                            },
                            index: index ?? 0);
                      }
                     

                      totallocation();
                   

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
      ),
    );
  }
}

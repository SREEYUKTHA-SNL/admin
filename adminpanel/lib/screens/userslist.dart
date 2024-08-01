import 'package:adminpanel/controller/admincontroller.dart';
import 'package:adminpanel/screens/delete.dart';
import 'package:adminpanel/screens/edituser.dart';
import 'package:adminpanel/screens/userdetails.dart';
import 'package:flutter/material.dart';

class Userlist extends StatefulWidget {
  const Userlist({
    super.key,
    this.index,
  });
  final int? index;

  @override
  State<Userlist> createState() => _UserlistState();
}

class _UserlistState extends State<Userlist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Hi admin!',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                CircleAvatar(
                  backgroundColor: Color(0xffE8F5F3),
                  radius: 40,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                            child: Text(
                          'no.of users :${admin.length}',
                          style: TextStyle(fontSize: 8),
                        )),
                        Center(
                            child: ValueListenableBuilder(
                          valueListenable: totalCount,
                          builder: (context, value, child) {
                            return Text('locations :$value',
                                style: TextStyle(fontSize: 8));
                          },
                        )),
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 8),
            Text('Welcome back to your panel.'),
            SizedBox(height: 16),
            Center(
              child: Text(
                'Users List',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: admin.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {},
                      child: _buildUserCard(context, admin[index], index));
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        height: 80,
        width: 70,
        decoration: BoxDecoration(shape: BoxShape.circle),
        child: FloatingActionButton(
          backgroundColor: Color(0xff0B8FAC),
          shape: CircleBorder(),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Edit(isAdd: true),
                ));
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 45,
          ),
        ),
      ),
    );
  }

  Widget _buildUserCard(
      BuildContext context, Map<String, dynamic> admin, int index) {
    final String username = admin['username'] ?? 'Unknown User';
    final String email = admin['useremail'] ?? 'No Email Provided';

    return Card(
      color: Color(0xffE8F5F3),
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: IconButton(
          icon: Icon(
            Icons.account_circle_outlined,
            size: 40,
            color: Color(0xff0B8FAC),
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserDetailsPage(userIndex: index),
                ));
          },
        ),
        title: Text(
          username,
          style: TextStyle(
            color: Color(0xff0B8FAC),
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(email),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.mode_edit_outlined, color: Color(0xff0B8FAC)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Edit(
                      isAdd: false,
                      index: index,
                    ),
                  ),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content:
                          Text("Are you sure you want to delete this user?"),
                      actions: <Widget>[
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            "NO",
                            style: TextStyle(color: Color(0xff0B8FAC)),
                          ),
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(80, 40),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              removeDetails(index);
                            });
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            "YES",
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff0B8FAC),
                            minimumSize: Size(80, 40),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

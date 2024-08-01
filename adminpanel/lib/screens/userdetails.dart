import 'package:adminpanel/controller/admincontroller.dart';
import 'package:adminpanel/screens/location.dart';
import 'package:flutter/material.dart';


class UserDetailsPage extends StatefulWidget {
  final int? userIndex;

  const UserDetailsPage({super.key, this.userIndex});

  @override
  State<UserDetailsPage> createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {
  final TextEditingController location = TextEditingController(); 

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'User Details',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.account_circle_outlined,
                  size: 110,
                  color: Color(0xff0B8FAC),
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'User No.#${widget.userIndex! + 1}',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff0B8FAC),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Details',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Container(
                      width: 200,
                      child: Text(
                        'Worem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti.',
                        style: TextStyle(
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 24),
            Center(
              child: Text(
                'Locations List',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Locationadd(
                            location: location,
                            userIndex: widget.userIndex!,
                          ),
                          
                        )).then((value) => setState(() {
                          
                        },));
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    backgroundColor: Color(0xff0B8FAC),
                  ),
                  child: Text(
                    'Add More Locations',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: admin[widget.userIndex!]['location'].length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Color(0xffE8F5F3),
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text(
                        admin[widget.userIndex!]['location'][index],
                        style: TextStyle(
                          color: Color(0xff0B8FAC),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text('ipsum dolo / ipsum dolo'),
                      trailing: ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: Text(
                                    "Are you sure you want to delete this user?"),
                                actions: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text("NO"),
                                          style: TextButton.styleFrom(
                                            foregroundColor: Colors.black,
                                            backgroundColor: Colors.white,
                                            padding: EdgeInsets.symmetric(
                                                vertical: 15.0),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 8.0),
                                      Expanded(
                                        child: TextButton(
                                          onPressed: () {
                                            setState(() {
                                              removeLocation(
                                                  index, widget.userIndex!);
                                            });
                                            Navigator.of(context).pop();
                                          },
                                          child: Text("YES"),
                                          style: TextButton.styleFrom(
                                            foregroundColor: Colors.white,
                                            backgroundColor: Color(0xff0B8FAC),
                                            padding: EdgeInsets.symmetric(
                                                vertical: 15.0),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          backgroundColor: Color(0xff0B8FAC),
                        ),
                        child: Text(
                          'Delete',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

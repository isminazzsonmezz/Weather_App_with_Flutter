import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:weather_app_with_flutter/widgets/custom_appBar_widget.dart';

class MyJsonApiFutureBuilder extends StatefulWidget {
  const MyJsonApiFutureBuilder({super.key});

  @override
  State<MyJsonApiFutureBuilder> createState() => _MyJsonApiFutureBuilderState();
}

class _MyJsonApiFutureBuilderState extends State<MyJsonApiFutureBuilder> {
  // List<User> users = [];
  late Future<List<User>> usersFuture;

  /*
    - setState → UI güncellenmesi için..
    - jsonMap["users"] → array’e erişim için..
  */
  Future<List<User>> _loadJson() async {
    final jsonString = await rootBundle.loadString('assets/data/users.json');

    final Map<String, dynamic> jsonMap = json.decode(jsonString);

    final List userList = jsonMap["users"];

    return userList.map((e) => User.fromJson(e)).toList();
    /*
    setState(() {
      users = userList.map((e) => User.fromJson(e)).toList();
    });
    */
  }

  @override
  void initState() {
    super.initState();
    usersFuture = _loadJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Json_Api_Builder", showBack: true),
      body: FutureBuilder(
        future: _loadJson(),
        builder: (context, asyncSnapshot) {
          if (asyncSnapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (asyncSnapshot.hasError) {
            return Center(child: Text("Error!!"));
          } else if (!asyncSnapshot.hasData || asyncSnapshot.data!.isEmpty) {
            return Center(child: Text("No Data!!"));
          } else {
            final users = asyncSnapshot.data!;

            return Container(
              child: users.isEmpty
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: users.length,
                      itemBuilder: (context, index) {
                        final user = users[index];
                        return Card(
                          margin: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          child: ListTile(
                            leading: CircleAvatar(
                              child: Text(user.id.toString()),
                            ),
                            title: Text(user.name),
                            subtitle: Text(user.username),
                            onTap: () {
                              SmartDialog.show(
                                builder: (context) {
                                  return Container(
                                    height:
                                        MediaQuery.of(context).size.height *
                                        0.4,
                                    width:
                                        MediaQuery.of(context).size.width * 0.7,
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(255, 147, 78, 159),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        children: [
                                          Text(
                                            "** Contact Details **",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(height: 15),
                                          Text(
                                            '- This users is e-mail: ${users[index].email}',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal,
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                          SizedBox(height: 15),
                                          Text(
                                            '- This users is phone: ${users[index].phone}',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal,
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                          SizedBox(height: 15),
                                          Text(
                                            '- This users is company: ${users[index].company}',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal,
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                          SizedBox(height: 15),
                                          Text(
                                            '- This users is website: ${users[index].website}',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal,
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        );
                      },
                    ),
            );
          }
        },
      ),
    );
  }
}

class User {
  final int id;
  final String name;
  final String username;
  final String email;
  final String phone;
  final String website;
  final String company;

  User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
    required this.website,
    required this.company,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"],
      name: json["name"],
      username: json["username"],
      email: json["email"],
      phone: json["phone"],
      website: json["website"],
      company: json["company"],
    );
  }
}

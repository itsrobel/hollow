import 'package:flutter/material.dart';
import 'package:flutter_custom_drawer/screen/chat_detail.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class ChatUser {
  final String id;
  final String username;
  ChatUser({
    required this.id,
    required this.username,
  });

  Map toJson() {
    return {
      '_id': id,
      'username': username,
    };
  }

  factory ChatUser.fromJson(Map<String, dynamic> json) {
    return ChatUser(
      id: json['_id'],
      username: json['username'],
    );
  }
}

class ChatUserListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ChatUser>>(
      future: _fetchUsers(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<ChatUser>? data = snapshot.data;
          return _userListView(data);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return CircularProgressIndicator();
      },
    );
  }

  Future<List<ChatUser>> _fetchUsers() async {
    // ignore: prefer_const_declarations
    final jobsListAPIUrl = 'http://localhost:3000/user/list';
    final response = await http.get(Uri.parse(jobsListAPIUrl));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      print(jsonResponse);
      return jsonResponse.map((job) => new ChatUser.fromJson(job)).toList();
    } else {
      throw Exception('Failed to load jobs from API');
    }
  }

  ListView _userListView(data) {
    return ListView.builder(
        itemCount: data.length,
        shrinkWrap: true,
        padding: EdgeInsets.only(top: 8.0),
        physics: ScrollPhysics(),
        itemBuilder: (context, index) {
          // return Text(data[index].username);
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ChatDetailPage(),
                      settings: RouteSettings(arguments: data[index].id)));
            },
            child: Container(
              padding:
                  EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 16,
                      ),
                      Expanded(
                          child: Container(
                              color: Colors.transparent,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    data[index].username,
                                    style: TextStyle(
                                        fontSize: 16, color: Color(0xFF8be9fd)),
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  // Text(
                                  //   widget.messageText,
                                  //   style: TextStyle(
                                  //       fontSize: 13,
                                  //       color: Colors.white,
                                  //       fontWeight: widget.isMessageRead
                                  //           ? FontWeight.bold
                                  //           : FontWeight.normal),
                                  // ),
                                ],
                              )))
                    ],
                  ))
                ],
              ),
            ),
          );
        });
  }

  // ListTile _tile(String title, String subtitle, IconData icon) => ListTile(
  //       title: Text(title,
  //           style: TextStyle(
  //             fontWeight: FontWeight.w500,
  //             fontSize: 20,
  //           )),
  //       subtitle: Text(subtitle),
  //       leading: Icon(
  //         icon,
  //         color: Colors.blue[500],
  //       ),
  //     );
}

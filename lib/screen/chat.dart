import 'package:flutter/material.dart';
import 'package:flutter_custom_drawer/widget/drawer.dart';
import 'package:flutter_custom_drawer/models/chat_users_model.dart';
import 'package:flutter_custom_drawer/widget/conversation_list.dart';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late Future<List<ChatUser>> futureUsers;
  void showDrawer() {
    print('tapped on show drawer!');
    setState(() {
      _showDrawer = !_showDrawer;
    });
  }

  Future<List<ChatUser>> fetchUser() async {
    final response =
        await http.get(Uri.parse('http://localhost:3000/user/list'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      // return Album.fromJson(jsonDecode(response.body));

      // return convert.jsonDecode(response.body) as Map<String, dynamic>;
      print(response.body);
      Iterable list = convert.json.decode(response.body);
      var user = list.map((model) => ChatUser.fromJson(model)).toList();
      print(user);
      return user;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      // throw Exception('Failed to load Users');
      return [];
    }
  }

  @override
  void initState() {
    super.initState();
    //futureUsers = fetchUser();
  }
  // Future getUsers() async {
  //   var url = Uri.parse('http://localhost:3000/user/list');
  //   var response = await http.get(url);

  //   if (response.statusCode == 200) {
  //     var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;

  //     if (jsonResponse['success'] == true) {}
  //   }
  // }

  bool _showDrawer = false;
  // List<ChatUsers> chatUsers = [
  //   ChatUsers("Jane Russel", "Awesome Setup", "assets/image1.jpg", "Now"),
  //   ChatUsers(
  //       "Glady's Murphy", "That's Great", "assets/image2.jpg", "Yesterday"),
  //   ChatUsers(
  //       "Jorge Henry", "Hey where are you?", "assets/image3.jpg", "31 Mar"),
  //   ChatUsers("Philip Fox", "Busy! Call me in 20 mins", "assets/image4.jpg",
  //       "28 Mar"),
  //   ChatUsers("Debra Hawkins", "Thankyou, It's awesome", "assets/image5.jpg",
  //       "23 Mar"),
  //   ChatUsers("Jacob Pena", "will update you in evening", "assets/image6.jpg",
  //       "17 Mar"),
  //   ChatUsers("Andrey Jones", "Can you please share the file?",
  //       "assets/image7.jpg", "24 Feb"),
  //   ChatUsers("John Wick", "How are you?", "assets/image8.jpg", "18 Feb"),
  // ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Color(0xFF44475a),
          appBar: AppBar(
            title: Text('Chat'),
            centerTitle: true,
            backgroundColor: Color(0xFF282a36),
            actions: [
              IconButton(
                icon: const Icon(Icons.add_comment),
                tooltip: 'create new chat',
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Creating new chat')));
                },
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: showDrawer,
            backgroundColor: Color(0xFF282a36),
            child: Icon(
              Icons.menu_rounded,
            ),
          ),
          body: new Stack(children: <Widget>[
            // new Container(

            //   decoration: new BoxDecoration(
            //     image: new DecorationImage(
            //       image: new AssetImage("assets/698610.jpg"),
            //     ),
            //   ),
            // ),
            new Padding(
              padding: EdgeInsets.only(top: 16, left: 16, right: 16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search...",
                  hintStyle: TextStyle(color: Colors.grey.shade600),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey.shade600,
                    size: 20,
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  contentPadding: EdgeInsets.all(8),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.grey.shade100)),
                ),
              ),
            ),
            new Container(
                padding: EdgeInsets.only(top: 64), child: ChatUserListView())
            // new Container(
            //   padding: EdgeInsets.only(top: 64),
            //   child: ListView.builder(
            //     itemCount: 4,
            //     shrinkWrap: true,
            //     padding: EdgeInsets.only(top: 12),
            //     physics: ScrollPhysics(),
            //     itemBuilder: (context, index) {
            //       FutureBuilder(
            //         future: futureUsers,
            //         builder: (context, AsyncSnapshot<ChatUsers> snapshot) {
            //           if (snapshot.hasData) {
            //             return Text(snapshot.data!.username);
            //           } else if (snapshot.hasError) {
            //             return Text('${snapshot.error}');
            //           }

            //           // By default, show a loading spinner.
            //           return const CircularProgressIndicator();
            //         },
            //       );
            //       // return ConversationList(
            //       //   chatUsers[index].name,
            //       //   chatUsers[index].messageText,
            //       //   // chatUsers[index].imageURL,
            //       //   chatUsers[index].time,
            //       //   true,
            //       // );
            //     },
            //   ),
            // )
          ]),
        ),
        if (_showDrawer)
          DrawerWidget(
            closeFunction: showDrawer,
          ),
      ],
    );
  }
}

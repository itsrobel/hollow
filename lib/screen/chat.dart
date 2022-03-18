import 'package:flutter/material.dart';
import 'package:flutter_custom_drawer/widget/drawer.dart';
import 'package:flutter_custom_drawer/models/chat_users_model.dart';
import 'package:flutter_custom_drawer/widget/conversation_list.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  void showDrawer() {
    print('tapped on show drawer!');
    setState(() {
      _showDrawer = !_showDrawer;
    });
  }

  bool _showDrawer = false;
  List<ChatUsers> chatUsers = [
    ChatUsers("Jane Russel", "Awesome Setup", "assets/image1.jpg", "Now"),
    ChatUsers(
        "Glady's Murphy", "That's Great", "assets/image2.jpg", "Yesterday"),
    ChatUsers(
        "Jorge Henry", "Hey where are you?", "assets/image3.jpg", "31 Mar"),
    ChatUsers("Philip Fox", "Busy! Call me in 20 mins", "assets/image4.jpg",
        "28 Mar"),
    ChatUsers("Debra Hawkins", "Thankyou, It's awesome", "assets/image5.jpg",
        "23 Mar"),
    ChatUsers("Jacob Pena", "will update you in evening", "assets/image6.jpg",
        "17 Mar"),
    ChatUsers("Andrey Jones", "Can you please share the file?",
        "assets/image7.jpg", "24 Feb"),
    ChatUsers("John Wick", "How are you?", "assets/image8.jpg", "18 Feb"),
  ];
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
              padding: EdgeInsets.only(top: 64),
              child: ListView.builder(
                itemCount: chatUsers.length,
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 12),
                physics: ScrollPhysics(),
                itemBuilder: (context, index) {
                  return ConversationList(
                    chatUsers[index].name,
                    chatUsers[index].messageText,
                    chatUsers[index].imageURL,
                    chatUsers[index].time,
                    true,
                  );
                },
              ),
            )
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

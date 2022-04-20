import 'package:flutter/material.dart';
import 'package:hollow_flutter/models/chat_msg_model.dart';
import 'package:hollow_flutter/models/chat_data_model.dart';

class User {
  final String name;
  final String url;

  const User(this.name, this.url);
}

class ChatDetailPage extends StatefulWidget {
  @override
  _ChatDetailPageState createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  List<ChatMessage> _results = [
    ChatMessage("Hello, Will", "receiver"),
    ChatMessage("How have you been?", "receiver"),
    ChatMessage("Hey Kriss, I am doing fine dude. wbu?", "sender"),
    ChatMessage("ehhhh, doing OK.", "receiver"),
    ChatMessage("Is there any thing wrong?", "sender"),
  ];

  @override
  void initState() {
    super.initState();
    _results.add(ChatMessage("test", "receiver"));
  }

  void _updateResults(String text) {
    setState(() {
      _results = [..._results, ChatMessage(text, "sender")];
    });
  }

  @override
  Widget build(BuildContext context) {
    final user_id = ModalRoute.of(context)!.settings.arguments as String;
    print(user_id);
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xff251F34),
          flexibleSpace: SafeArea(
            child: Container(
              padding: EdgeInsets.only(right: 16),
              child: Row(
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  // CircleAvatar(
                  //   backgroundImage: AssetImage(user.imageUrl.toString()),
                  //   maxRadius: 20,
                  // ),
                  SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        // Text(
                        //   user.name.toString(),
                        //   style: TextStyle(
                        //       fontSize: 16,
                        //       fontWeight: FontWeight.w600,
                        //       color: Colors.white),
                        // ),
                        // SizedBox(
                        //   height: 6,
                        // ),
                        // Text(
                        //   "Online",
                        //   style: TextStyle(color: Colors.white, fontSize: 13),
                        // ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Stack(
          children: <Widget>[
            // ListView.builder(
            //   itemCount: _results.length,
            //   shrinkWrap: true,
            //   padding: EdgeInsets.only(top: 10, bottom: 10),
            //   physics: NeverScrollableScrollPhysics(),
            //   itemBuilder: (context, index) {
            // return Container(
            //   padding:
            //       EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
            //   child: Align(
            //     alignment: (_results[index].messageType == "receiver"
            //         ? Alignment.topLeft
            //         : Alignment.topRight),
            //     child: Container(
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(20),
            //         color: (_results[index].messageType == "receiver"
            //             ? Colors.grey.shade200
            //             : Colors.blue[200]),
            //       ),
            //       padding: EdgeInsets.all(16),
            //       child: Text(
            //         _results[index].messageContent,
            //         style: TextStyle(fontSize: 15),
            //       ),
            //     ),
            //   ),
            // );
            //   },
            // ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: EdgeInsets.only(left: 10, bottom: 40, top: 10),
                height: 100,
                width: double.infinity,
                color: Color(0xff251F34),
                child: Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: Color(0xff14DAE2),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: TextField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            hintText: "Write message...",
                            hintStyle: TextStyle(color: Colors.white),
                            border: InputBorder.none),
                        onSubmitted: (value) => _updateResults(value),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    FloatingActionButton(
                      onPressed: () {},
                      child: Icon(
                        Icons.send,
                        color: Colors.white,
                        size: 18,
                      ),
                      backgroundColor: Color(0xff14DAE2),
                      elevation: 0,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}

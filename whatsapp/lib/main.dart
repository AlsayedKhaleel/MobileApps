import 'package:flutter/material.dart';
import 'package:whatsapp/chats.dart';
import 'package:whatsapp/backend_data.dart';

void main() {
  runApp(WhatsApp());
}

class WhatsApp extends StatelessWidget {
  const WhatsApp({super.key});

  @override
  Widget build(BuildContext context) {
    // construct the objects from those maps.
    List<WhatsAppChat> chatsObjs = backendData.map((e) => WhatsAppChat.fromJason(e)).toList();

    return MaterialApp(
      home: Scaffold(
        appBar: _makeHomeAppBar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                _makeCustomeChats(icon: Icons.lock, label: "Locked Chats"),
                SizedBox(height: 10),
                _makeCustomeChats(icon: Icons.archive, label: "Archived", count: 10,),
                SizedBox(height: 10),
                _makeNormalChats(chatsObjs),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          child: Icon(Icons.chat),
        ),
      ),
    );
  }
}

// home screen's appbar.
AppBar _makeHomeAppBar() {
  return AppBar(
    backgroundColor: Colors.green,
    title: Text(
      "WhatsApp",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: Colors.white,
      ),
    ),
    actions: [
      Icon(Icons.camera_alt_outlined, color: Colors.white),
      SizedBox(width: 15),
      Icon(Icons.search, color: Colors.white),
      SizedBox(width: 10),
      Icon(Icons.more_vert, color: Colors.white),
    ],
  );
}

// custome chats [locked, archived].
Row _makeCustomeChats({IconData? icon, String? label, int? count}) {
  return Row(
    children: [
      SizedBox(width: 8),
      Icon(icon, color: Colors.green),
      SizedBox(width: 15),
      Text(
        label!,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
          color: Colors.green,
        ),
      ),
      Spacer(),
      if (count != 0 && count != null)
        Text(
          count.toString(),
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
        ),
    ],
  );
}

// the reset normal chats.
Widget _makeNormalChats(List chats) {
  return ListView.builder(
    physics: NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemCount: chats.length,
    itemBuilder: (context, index) => Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        crossAxisAlignment: .start,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(chats[index].imageUrl??""),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: .start,
            children: [
              Text(
                chats[index].name??"",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              _makeMessage(chats[index].messageType, chats[index].messageContent),
            ],
          ),
          Spacer(),
          Text(chats[index].arrivalTime??""),
        ],
      ),
    ),
  );
}

// print the messages appropriately based on its type.
Widget _makeMessage(String messageType, String msg) {
  if (messageType == "video") {
    return Row(children: [Icon(Icons.videocam_rounded), Text(msg)]);
  } 
  else if (messageType == "gif") {
    return Row(children: [Icon(Icons.gif), Text("GIF")]);
  } 
  else if (messageType == "text") {
    return Text(msg);
  } 
  else {
    return Text(
      "Erorr, unknown message type",
      style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
    );
  }
}

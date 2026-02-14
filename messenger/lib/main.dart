import 'package:flutter/material.dart';
import 'package:messenger/backend_data.dart';
import 'package:messenger/chats.dart';

void main() {
  runApp(const Messenger());
}

class Messenger extends StatelessWidget {
  const Messenger({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    List<MessengerChat> chats = backendData
        .map((e) => MessengerChat.fromJason(e))
        .toList();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: _makeAppBar(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                _searchField(),
                SizedBox(height: 20),
                _makeSlidingChats(chats),
                _makeNormalChats(chats),
              ],
            ),
          ),
        ),
        bottomNavigationBar: _makeBottomNavBar(),
      ),
    );
  }
}

// construct the bottom navigation bar.
Widget _makeBottomNavBar() {
  return Container(
    height: 50,
    child: Row(
      mainAxisAlignment: .spaceAround,
      children: [
        _makeBottomNavBarIcon(Icons.chat, "Chats"),
        _makeBottomNavBarIcon(Icons.call, "Calls"),
        _makeBottomNavBarIcon(Icons.person, "People"),
        _makeBottomNavBarIcon(Icons.settings, "Settings"),
      ],
    ),
  );
}

// the 4 icons of the bottom navigation bar.
Widget _makeBottomNavBarIcon(IconData icon, String label) {
  return Column(children: [Icon(icon), Text(label)]);
}

// the normal chats in the rest of the screen
Widget _makeNormalChats(List<MessengerChat> chats) {
  return ListView.builder(
    physics: NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemCount: chats.length,
    itemBuilder: (c, i) => Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        children: [
          _makeChatIcon(chats, i),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: .start,
            children: [
              Text(
                chats[i].name ?? "",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 150,
                    child: Text(
                      style: TextStyle(overflow: TextOverflow.ellipsis),
                      chats[i].messageContent ?? "",
                    ),
                  ),
                  Text(chats[i].arrivalTime ?? ""),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

// the chats moving right & left.
Widget _makeSlidingChats(List<MessengerChat> chats) {
  return SizedBox(
    height: 100,
    child: ListView.builder(
      scrollDirection: .horizontal,
      shrinkWrap: true,
      itemCount: chats.length,
      itemBuilder: (c, i) => Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: Column(
          children: [
            _makeChatIcon(chats, i),
            Text(
              chats[i].name ?? "",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    ),
  );
}

// the icon of each chat.
Widget _makeChatIcon(List<MessengerChat> chats, int i) {
  return Stack(
    alignment: AlignmentGeometry.bottomRight,
    children: [
      CircleAvatar(
        radius: 30,
        backgroundImage: NetworkImage(chats[i].imageUrl ?? ""),
      ),
      if (chats[i].isonline == true)
        Positioned(
          child: CircleAvatar(backgroundColor: Colors.green, radius: 10),
        ),
    ],
  );
}

// search bar.
Widget _searchField() {
  return Container(
    height: 60,
    width: double.infinity,
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 241, 234, 234),
      borderRadius: BorderRadius.circular(30),
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(Icons.search),
          hintText: "Search",
        ),
      ),
    ),
  );
}

// create the app bar of the home screen.
AppBar _makeAppBar() {
  return AppBar(
    backgroundColor: Colors.white,
    scrolledUnderElevation: 0.0,
    leadingWidth: 60,
    leading: Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: CircleAvatar(
        backgroundColor: const Color.fromARGB(255, 241, 234, 234),
        child: Icon(Icons.menu),
      ),
    ),
    title: Text(
      "Chats",
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
    ),
    actions: [
      _actionsIcons(
        Icons.camera_alt_outlined,
        const Color.fromARGB(255, 241, 234, 234),
      ),
      SizedBox(width: 20),
      _actionsIcons(Icons.edit, const Color.fromARGB(255, 241, 234, 234)),
      SizedBox(width: 20),
    ],
  );
}

// create the icons in the action section.
CircleAvatar _actionsIcons(IconData icon, Color color) {
  return CircleAvatar(backgroundColor: color, child: Icon(icon));
}

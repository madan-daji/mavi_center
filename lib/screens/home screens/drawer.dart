import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_school/screens/drawer/about_us_screen.dart';
import 'package:my_school/widgets/list_tile.dart';

class DrawerScreen extends StatelessWidget {
  final String userName;
  final String userPhotoUrl;
  final VoidCallback onSignOut;

  const DrawerScreen({
    Key? key,
    required this.userName,
    required this.userPhotoUrl,
    required this.onSignOut,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          // Drawer Header with User Info
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xFF674AEF),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(userPhotoUrl),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      'Hello,',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 15),
                    Text(
                      userName,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // List of Drawer Items
          MyListTile(
              icon: Icons.home,
              title: "Home",
              onTap: () {
                Navigator.pop(context);
              }),

          MyListTile(
            icon: Icons.event,
            title: "Events",
            onTap: () {},
          ),
          MyListTile(
            icon: Icons.people,
            title: "Teachers",
            onTap: () {},
          ),
          MyListTile(
            icon: Icons.map,
            title: "Location",
            onTap: () {},
          ),
          MyListTile(
            icon: Icons.share,
            title: "Share",
            onTap: () {},
          ),
          MyListTile(
            icon: Icons.book,
            title: "About Us",
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AboutUsScreen()));
            },
          ),
          MyListTile(
              icon: Icons.logout,
              title: "Log Out",
              onTap: () {
                FirebaseAuth.instance.signOut();
              }),
        ],
      ),
    );
  }
}

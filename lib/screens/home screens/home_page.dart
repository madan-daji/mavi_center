import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_school/screens/Courses/all_courses.dart';
import 'package:my_school/screens/Teachers/all_teachers.dart';

import 'package:my_school/screens/home%20screens/carousel_slider.dart';
import 'package:my_school/screens/home%20screens/quick_links.dart';

import 'package:my_school/screens/login_signUp/google_sign_in.dart';
import 'package:my_school/widgets/search_widget.dart';
import 'drawer.dart';

class HomeScreen extends StatefulWidget {
  final User user;

  HomeScreen({required this.user});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Color(0xFF674AEF),
        centerTitle: true,
        title: Text(
          'Ma Vi Center',
          style: GoogleFonts.montserrat(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: <Widget>[
          IconButton(
            color: Colors.black,
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      drawer: DrawerScreen(
        userPhotoUrl: widget.user.photoURL ?? 'Photo',
        userName: widget.user.displayName ?? 'User',
        onSignOut: () async {
          await FirebaseAuth.instance.signOut();
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => GoogleSignInScreen()),
          );
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    "Welcome, ",
                    style: GoogleFonts.montserrat(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "${widget.user.displayName}",
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      color: Colors.grey.shade900,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Carousel Slider
              MyCarousel(),
              SizedBox(height: 20),

              // Search Field
              SearchWidget(),
              SizedBox(height: 20),

              // Quick Links
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.all(10),
                children: [
                  QuickLinkCard(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CoursesScreen()));
                    },
                    icon: Icons.book,
                    label: 'Courses',
                  ),
                  QuickLinkCard(
                    onTap: () {},
                    icon: Icons.face,
                    label: 'Facilities',
                  ),
                  QuickLinkCard(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TeachersScreen()));
                    },
                    icon: Icons.people,
                    label: 'Teachers',
                  ),
                  QuickLinkCard(
                    onTap: () {},
                    icon: Icons.library_add,
                    label: 'Gallery',
                  ),
                ],
              ),

              // Recent Activity
              Text(
                'Recent Activity',
                style: GoogleFonts.montserrat(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: ListTile(
                  leading: Icon(Icons.check_circle),
                  title: Text('Math Assignment Submitted'),
                  subtitle: Text('June 10th, 2024'),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: ListTile(
                  leading: Icon(Icons.check_circle),
                  title: Text('Science Project Graded'),
                  subtitle: Text('June 12th, 2024'),
                ),
              ),

              // Contact Information
              Text(
                'Contact Information',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: ListTile(
                  leading: Icon(Icons.phone),
                  title: Text('School Office'),
                  subtitle: Text('9864354724'),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: ListTile(
                  leading: Icon(Icons.email),
                  title: Text('Email Us'),
                  subtitle: Text('mb614348@gmail.com'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

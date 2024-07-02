import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF674AEF),
        title: Text(
          'Welcome to Our School',
          style: GoogleFonts.montserrat(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildHeader(),
            SizedBox(height: 20),
            _buildSchoolInformation(),
            SizedBox(height: 20),
            _buildMissionValues(),
            SizedBox(height: 20),
            _divider(),
            _buildContactInfo(),
            SizedBox(height: 20),
            _divider(),
            _buildLocation(),
            SizedBox(height: 20),
            _divider(),
            _buildSocialMediaLinks(),
            SizedBox(height: 20),
            _divider(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFF674AEF),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'Educating Minds, Empowering Futures',
            style: GoogleFonts.montserrat(
              fontSize: 16,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildSchoolInformation() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'School Information',
            style: GoogleFonts.montserrat(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF674AEF),
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
            'Nullam dignissim, metus ac molestie commodo, nunc elit '
            'mollis ex, vel interdum diam metus et odio.',
            style: GoogleFonts.montserrat(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMissionValues() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Our Mission & Values',
            style: GoogleFonts.montserrat(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF674AEF),
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Our mission is to provide quality education...',
            style: GoogleFonts.montserrat(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Our core values include excellence, integrity, '
            'community, and innovation.',
            style: GoogleFonts.montserrat(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactInfo() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Contact Information',
            style: GoogleFonts.montserrat(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF674AEF),
            ),
          ),
          SizedBox(height: 10),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text('Phone: 9864354724'),
          ),
          ListTile(
            leading: Icon(Icons.email),
            title: Text('Email: mb614348@gmail.com'),
          ),
        ],
      ),
    );
  }

  Widget _buildLocation() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Location',
            style: GoogleFonts.montserrat(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF674AEF),
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Near Kalika Temple, Tulsipur, Dang',
            style: GoogleFonts.montserrat(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialMediaLinks() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Follow Us',
            style: GoogleFonts.montserrat(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF674AEF),
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: <Widget>[
              IconButton(
                icon: FaIcon(FontAwesomeIcons.facebook),
                onPressed: () {
                  // Handle Facebook link
                },
              ),
              IconButton(
                icon: FaIcon(FontAwesomeIcons.youtube),
                onPressed: () {
                  // Handle Twitter link
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget _divider() {
  return Divider(
    thickness: 1,
  );
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CoursesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF674AEF),
        title: Text(
          'Courses',
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          _buildCourseTile(context, title: 'Normal 1-10', onTap: () {
            // Navigate to Normal 1-10 screen
          }),
          _buildCourseTile(context, title: 'Information Technology', onTap: () {
            // Navigate to Information Technology screen
          }),
          _buildCourseTile(context, title: 'Electrical Engineering', onTap: () {
            // Navigate to Electrical Engineering screen
          }),
          _buildCourseTile(context, title: 'Zeometrics', onTap: () {
            // Navigate to Zeometrics screen
          }),
          _buildCourseTile(context, title: 'Science', onTap: () {
            // Navigate to Science screen
          }),
          _buildCourseTile(context, title: 'Management', onTap: () {
            // Navigate to Management screen
          }),
        ],
      ),
    );
  }

  Widget _buildCourseTile(BuildContext context,
      {required String title, required VoidCallback onTap}) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(
          title,
          style: GoogleFonts.montserrat(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: onTap,
      ),
    );
  }
}

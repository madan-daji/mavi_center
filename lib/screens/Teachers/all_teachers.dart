import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Example data model for teacher
class Teacher {
  final String name;
  final String position;
  final String image;

  Teacher({
    required this.name,
    required this.position,
    required this.image,
  });
}

// Example list of teachers (replace with actual data fetching)
final List<Teacher> teachers = [
  Teacher(
    name: 'Bhagwat Poudel',
    position: 'Principal',
    image: 'assets/images/1.jpg',
  ),
  Teacher(
    name: 'Bhola Prasad Poudel',
    position: 'Vice-Principal',
    image: '', // Example asset image path
  ),
  Teacher(
    name: 'Lekhatram Poudel',
    position: 'President',
    image: 'assets/images/3.jpg',
  ),
  Teacher(
    name: 'Shishir Poudel',
    position: 'Head of IT',
    image: '', // Example asset image path
  ),
  Teacher(
    name: 'Rabin Regmi',
    position: 'Programming Expert',
    image: 'assets/images/5.jpg',
  ),
];

class TeachersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF674AEF),
        title: Text(
          'Our Teachers',
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: teachers.length,
        itemBuilder: (context, index) {
          return _buildTeacherCard(context, teachers[index]);
        },
      ),
    );
  }

  Widget _buildTeacherCard(BuildContext context, Teacher teacher) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundImage: teacher.image.isNotEmpty
              ? AssetImage(teacher.image)
              : AssetImage(''), // Default image path if image is empty
        ),
        title: Text(
          teacher.name,
          style: GoogleFonts.montserrat(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          teacher.position,
          style: GoogleFonts.montserrat(
            fontSize: 14,
            color: Colors.grey.shade600,
          ),
        ),
        onTap: () {
          // Handle tapping on the teacher tile
        },
      ),
    );
  }
}

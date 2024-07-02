import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../login_signUp/google_sign_in.dart';

class ProfileScreen extends StatelessWidget {
  final User user;

  const ProfileScreen({Key? key, required this.user}) : super(key: key);

  Future<void> _signOut(BuildContext context) async {
    await GoogleSignIn().signOut();
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => GoogleSignInScreen()),
    );
  }

  Future<void> _reAuthenticateAndDelete(BuildContext context) async {
    try {
      // Re-authenticate the user
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        // The user canceled the sign-in
        return;
      }
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Re-authenticate the user with the new credentials
      await FirebaseAuth.instance.currentUser!
          .reauthenticateWithCredential(credential);

      // Delete the user account
      await user.delete();
      await googleSignIn.signOut();
      await FirebaseAuth.instance.signOut();

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => GoogleSignInScreen()),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to delete account: $e'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'User Profile',
          style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xFF674AEF),
      ),
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.network(
              user.photoURL ?? '',
              fit: BoxFit.cover,
              color: Colors.black.withOpacity(0.8),
              colorBlendMode: BlendMode.darken,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Profile picture
                Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(user.photoURL ?? ''),
                  ),
                ),
                SizedBox(height: 20),
                // User's display name
                Text(
                  user.displayName ?? 'No Name',
                  style: GoogleFonts.montserrat(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                // User's email
                Text(
                  user.email ?? 'No Email',
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
                SizedBox(height: 30),
                // Sign Out button
                ElevatedButton(
                  onPressed: () => _signOut(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF674AEF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  ),
                  child: Text(
                    'Sign Out',
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                // Additional user info
                Divider(color: Colors.white54),
                ListTile(
                  leading: Icon(Icons.person, color: Colors.white),
                  title: Text(
                    user.displayName ?? 'No Name',
                    style: GoogleFonts.montserrat(color: Colors.white),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.email, color: Colors.white),
                  title: Text(
                    user.email ?? 'No Email',
                    style: GoogleFonts.montserrat(color: Colors.white),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.calendar_today, color: Colors.white),
                  title: Text(
                    'Joined: ${user.metadata.creationTime?.toLocal()}',
                    style: GoogleFonts.montserrat(color: Colors.white),
                  ),
                ),
                // Delete Account ListTile
                ListTile(
                  leading: Icon(Icons.delete, color: Colors.white),
                  title: Text(
                    'Delete Account',
                    style: GoogleFonts.montserrat(color: Colors.white),
                  ),
                  onTap: () => _reAuthenticateAndDelete(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

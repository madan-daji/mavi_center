import 'package:flutter/material.dart';

// ignore: must_be_immutable
class QuickLinkCard extends StatelessWidget {
  void Function()? onTap;
  final IconData icon;
  final String label;

  QuickLinkCard({super.key, required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [           
            Icon(icon, size: 40, color: Color(0xFF674AEF),),
            SizedBox(height: 10),
            Text(label, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}

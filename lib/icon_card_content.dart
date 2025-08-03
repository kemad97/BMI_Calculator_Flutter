import 'package:flutter/material.dart';

import 'AppColors.dart';

class IconCardContent extends StatelessWidget {
  final String txt;
  final IconData icon;

  const IconCardContent({required this.txt, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 40, color: Colors.white),
        SizedBox(height: 16.0),
        Text(
          txt,
          style: TextStyle(color: AppColors.lightTextGrey, fontSize: 18),
        ),
      ],
    );
  }
}

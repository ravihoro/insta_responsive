import 'package:flutter/material.dart';
import 'package:insta_responsive/pages/content.dart';
import 'package:insta_responsive/pages/navbar.dart';
import 'package:insta_responsive/responsive.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Responsive(
        mobile: Container(),
        tablet: Container(),
        desktop: Row(
          children: [
            NavBar(),
            Center(
              child: Content(),
            ),
          ],
        ),
      ),
    );
  }
}

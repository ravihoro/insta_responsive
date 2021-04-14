import 'package:flutter/material.dart';
import 'package:insta_responsive/pages/bottom_bar.dart';
import 'package:insta_responsive/pages/content.dart';
import 'package:insta_responsive/pages/mobile_home.dart';
import 'package:insta_responsive/pages/navbar.dart';
import 'package:insta_responsive/responsive.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Responsive(
        mobile: MobileHome(),
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
      bottomNavigationBar: Responsive.isMobile(context)
          ? BottomBar()
          : Container(
              height: 0,
            ),
    );
  }
}

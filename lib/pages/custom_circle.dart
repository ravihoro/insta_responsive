import 'package:flutter/material.dart';

class CustomCircle extends StatelessWidget {
  final String imageUrl;
  final bool isUserImage;

  CustomCircle({
    this.imageUrl,
    this.isUserImage = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.amber,
            Colors.pink,
            Colors.purple,
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
        borderRadius: BorderRadius.circular(100),
      ),
      alignment: Alignment.center,
      child: Container(
        height: 95,
        width: 95,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(47),
        ),
        child: Padding(
          padding: EdgeInsets.all(5.0),
          child: isUserImage
              ? Stack(
                  children: [
                    Opacity(
                      opacity: 0.5,
                      child: CircleAvatar(
                        maxRadius: 50,
                        backgroundImage: NetworkImage(
                          imageUrl,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 30,
                      left: 30,
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ],
                )
              : CircleAvatar(
                  maxRadius: 50,
                  backgroundImage: NetworkImage(
                    imageUrl,
                  ),
                ),
        ),
      ),
    );
  }
}

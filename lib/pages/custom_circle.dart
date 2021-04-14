import 'package:flutter/material.dart';

class CustomCircle extends StatelessWidget {
  final String imageUrl;
  final bool isUserImage;
  final double dimensions;
  final bool desktop;

  CustomCircle({
    this.imageUrl,
    this.isUserImage = false,
    this.dimensions = 100,
    this.desktop = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: dimensions,
      width: dimensions,
      decoration: BoxDecoration(
        gradient: !isUserImage || desktop
            ? LinearGradient(
                colors: [
                  Colors.amber,
                  Colors.pink,
                  Colors.purple,
                ],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              )
            : null,
        borderRadius: BorderRadius.circular(dimensions),
      ),
      alignment: Alignment.center,
      child: Container(
        height: dimensions - 5,
        width: dimensions - 5,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(47),
        ),
        child: Padding(
          padding: EdgeInsets.all(5.0),
          child: isUserImage
              ? desktop
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
                  : Stack(
                      children: [
                        CircleAvatar(
                          maxRadius: 50,
                          backgroundImage: NetworkImage(
                            imageUrl,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            alignment: Alignment.center,
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.blue,
                            ),
                            child: Icon(
                              Icons.add,
                              size: 18,
                              color: Colors.white,
                            ),
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

import 'package:flutter/material.dart';
import 'package:insta_responsive/pages/custom_circle.dart';
import '../mock_data.dart';
import 'dart:math';

class MobileHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        //mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(
                  Icons.add_box_outlined,
                  color: Colors.white,
                ),
                Spacer(),
                Container(
                  height: 30,
                  width: 100,
                  child: Image.asset(
                    'assets/insta_text.jpg',
                  ),
                ),
                Spacer(),
                Icon(
                  Icons.near_me_outlined,
                  color: Colors.white,
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 80,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: imageUrls.length,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            CustomCircle(
                              desktop: false,
                              dimensions: 80,
                              imageUrl: imageUrls[index],
                              isUserImage: index == 0,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Column(
                    children: contentImageUrls.map((e) {
                      return _img(e);
                      // return Container(
                      //   height: 350,
                      //   //width: 200,
                      //   decoration: BoxDecoration(
                      //     color: Colors.red,
                      //     image: DecorationImage(
                      //       fit: BoxFit.cover,
                      //       image: NetworkImage(
                      //         e,
                      //       ),
                      //     ),
                      //   ),
                      // );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _img(String url) {
    Random random = Random();
    return Container(
      height: 520,
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              children: [
                CustomCircle(
                  dimensions: 50,
                  desktop: false,
                  imageUrl: url,
                  isUserImage: false,
                ),
                Spacer(),
                Icon(
                  Icons.more_vert,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 350,
            //width: 200,
            decoration: BoxDecoration(
              //color: Colors.red,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  url,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              children: [
                Icon(
                  Icons.favorite_outline,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 15,
                ),
                Icon(
                  Icons.mode_comment_outlined,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 15,
                ),
                Icon(
                  Icons.near_me_outlined,
                  color: Colors.white,
                ),
                Spacer(),
                Icon(
                  Icons.bookmark_border_outlined,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Text(
                  random.nextInt(100).toString(),
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'likes',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Text(
                  random.nextInt(23).toString(),
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'hours ago',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

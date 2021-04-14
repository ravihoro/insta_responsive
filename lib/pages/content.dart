import 'package:flutter/material.dart';
import 'package:insta_responsive/pages/custom_circle.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../mock_data.dart';

class Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      color: Colors.black87,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              _header(),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Text(
                    'Stories',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.play_circle_outline,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    'Watch All',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 100,
                child: _customListView(),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Text(
                    'Feed',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Text(
                    'Latest',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    'Popular',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: StaggeredGridView.countBuilder(
                  itemCount: contentImageUrls.length,
                  crossAxisCount: 4,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  staggeredTileBuilder: (index) {
                    return StaggeredTile.count(
                      index % 7 == 0 ? 2 : 1,
                      index % 7 == 0 ? 2 : 1,
                    );
                  },
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Expanded(
                          child: Container(
                            height: 200,
                            //width: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              //color: Colors.red,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  contentImageUrls[index],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          color: Colors.grey[900],
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Spacer(),
                              _iconText(Icons.favorite_outline, '148'),
                              SizedBox(
                                width: 10.0,
                              ),
                              _iconText(Icons.chat_bubble_outline, '7'),
                              SizedBox(
                                width: 10.0,
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _iconText(IconData icon, String val) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.white,
        ),
        SizedBox(
          width: 5.0,
        ),
        Text(
          val,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _customListView() {
    return ListView.builder(
      itemCount: imageUrls.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Row(
          children: [
            CustomCircle(
              imageUrl: imageUrls[index],
              isUserImage: index == 0 ? true : false,
            ),
            SizedBox(
              width: 20,
            ),
          ],
        );
      },
    );
  }

  Widget _header() {
    return Row(
      children: [
        Container(
          alignment: Alignment.center,
          height: 40,
          width: 250,
          decoration: BoxDecoration(
            color: Colors.grey[800],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.search,
                color: Colors.white,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Search",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        Spacer(),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.notifications_outlined),
          color: Colors.white,
        ),
        SizedBox(
          width: 5.0,
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.near_me_outlined),
          color: Colors.white,
        ),
        SizedBox(
          width: 5.0,
        ),
        Container(
          height: 40,
          width: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              colors: [
                Colors.orange,
                Colors.pink,
                Colors.purple,
              ],
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.add_circle,
                color: Colors.white,
              ),
              Text(
                'Add Photo',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

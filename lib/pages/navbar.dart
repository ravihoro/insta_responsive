import 'package:flutter/material.dart';
import 'package:insta_responsive/pages/custom_circle.dart';

List<String> texts = [
  'Feed',
  'Explore',
  'Notification',
  'Direct',
  'IG TV',
  'Stats',
  'Settings',
];

List<IconData> icons = [
  Icons.rss_feed,
  Icons.search,
  Icons.notifications,
  Icons.share,
  Icons.tv,
  Icons.bar_chart,
  Icons.settings,
];

List<IconData> iconsOutline = [
  Icons.rss_feed_outlined,
  Icons.search_outlined,
  Icons.notifications_outlined,
  Icons.share_outlined,
  Icons.tv_outlined,
  Icons.bar_chart_outlined,
  Icons.settings_outlined,
];

class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  String currentSelected = texts[0];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.2,
      color: Colors.black,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
              top: 15,
              bottom: 20,
            ),
            child: Row(
              children: [
                Container(
                  height: 40,
                  width: 50,
                  child: Image.asset(
                    'assets/insta_logo.png',
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  height: 30,
                  width: 150,
                  child: Image.asset(
                    'assets/insta_text.jpg',
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: CustomCircle(
              imageUrl:
                  "https://images.unsplash.com/photo-1522075469751-3a6694fb2f61?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80",
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              'Ravi Horo',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              '@ravijohn',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _customRow(
                "46",
                "Posts",
              ),
              Container(
                height: 30.0,
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(
                      width: 1.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              _customRow(
                "2.5k",
                'Followers',
              ),
              Container(
                height: 30.0,
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(
                      width: 1.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              _customRow(
                "526",
                "Following",
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Flexible(
            child: ListView.builder(
              itemCount: texts.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    //print(currentSelected);
                    setState(() {
                      currentSelected = texts[index];
                    });
                  },
                  child: NavbarItem(
                    icon: currentSelected == texts[index]
                        ? icons[index]
                        : iconsOutline[index],
                    text: texts[index],
                    selected: currentSelected == texts[index],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 1.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          _customListTile(Icons.exit_to_app, "Logout"),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  Widget _customListTile(IconData icon, String text) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.white,
      ),
      title: Text(
        text,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _customRow(String val, String str) {
    return Column(
      children: [
        Text(
          val,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        SizedBox(
          height: 5.0,
        ),
        Text(
          str,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class NavbarItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool selected;

  NavbarItem({
    this.icon,
    this.text,
    this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          SizedBox(
            width: 10,
          ),
          Icon(
            icon,
            color: Colors.white,
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            text,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          Spacer(),
          selected
              ? Container(
                  padding: EdgeInsets.zero,
                  height: 20,
                  width: 2.0,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.orange,
                        Colors.pink,
                        Colors.purple,
                      ],
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}

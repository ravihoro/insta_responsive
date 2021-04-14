import 'package:flutter/material.dart';

List<IconData> icons = [
  Icons.home,
  Icons.search,
  Icons.video_library_rounded,
  Icons.favorite,
  Icons.person,
];

List<IconData> iconsOutline = [
  Icons.home_outlined,
  Icons.search_outlined,
  Icons.video_library_outlined,
  Icons.favorite_outline,
  Icons.person_outline,
];

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: icons.map((e) {
          return InkWell(
            onTap: () {
              setState(() {
                currentIndex = icons.indexOf(e);
              });
            },
            child: BottomBarItem(
              icon: icons.indexOf(e) == currentIndex
                  ? icons[icons.indexOf(e)]
                  : iconsOutline[icons.indexOf(e)],
              selected: icons.indexOf(e) == currentIndex,
            ),
          );
        }).toList(),
      ),
    );
  }
}

class BottomBarItem extends StatelessWidget {
  final IconData icon;
  final bool selected;

  BottomBarItem({
    this.icon,
    this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: selected ? Colors.white : Colors.grey,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:netflix/utils/assets.dart';

class UserIcon extends StatelessWidget {
  final String name;
  final String iconUrl;
  final void Function() onPressed;
  const UserIcon(
      {super.key,
      required this.name,
      required this.onPressed,
      this.iconUrl = NetflixIcons.blueUser});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          SizedBox(
              height: 140,
              child: Image.asset(
                iconUrl,
                fit: BoxFit.fill,
              )),
          Text(
            name,
            style: Theme.of(context).textTheme.subtitle1,
          )
        ],
      ),
    );
  }
}

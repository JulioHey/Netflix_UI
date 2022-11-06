import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:netflix/utils/assets.dart';

void main() {
  testWidgets('UserIcon', (WidgetTester tester) async {
    await tester
        .pumpWidget(UserIcon(name: "Julio", isEditing: true, onPressed: () {}));
  });
}

class UserIcon extends StatelessWidget {
  final String name;
  final String iconUrl;
  final void Function() onPressed;
  final bool isEditing;
  const UserIcon(
      {super.key,
      required this.name,
      required this.isEditing,
      required this.onPressed,
      this.iconUrl = NetflixIcons.blueUser});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          SizedBox(
              height: width * 0.225,
              width: width * 0.225,
              child: Stack(
                children: [
                  Image.asset(
                    iconUrl,
                    fit: BoxFit.fill,
                  ),
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(0, 0, 0, isEditing ? 0.5 : 0),
                    ),
                  ),
                  Center(
                    child: Visibility(
                      visible: isEditing,
                      child: const Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
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

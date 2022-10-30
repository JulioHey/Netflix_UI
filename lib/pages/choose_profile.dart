import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:netflix/router/route_utils.dart';
import 'package:netflix/theme/colors.dart';
import 'package:netflix/utils/assets.dart';
import 'package:netflix/widget/user_splash.dart';

class ChooseProfile extends StatefulWidget {
  const ChooseProfile({Key? key}) : super(key: key);

  @override
  _ChooseProfileState createState() => _ChooseProfileState();
}

class _ChooseProfileState extends State<ChooseProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NetflixColors.black,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(),
                  SizedBox(
                      height: 40, child: Image.asset(NetflixIcons.netflix)),
                  GestureDetector(
                    child: const Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                    onTap: () {
                      context.goNamed(Pages.login.toName);
                    },
                  )
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                height: 600,
                child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5),
                  children: [
                    UserIcon(
                      name: "Julio",
                      onPressed: () {},
                    ),
                    UserIcon(
                      name: "Mãe",
                      onPressed: () {},
                    ),
                    UserIcon(
                      name: "Pai",
                      onPressed: () {},
                    ),
                    UserIcon(
                      name: "Helena",
                      onPressed: () {},
                    ),
                    UserIcon(
                      name: "Guilherme",
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

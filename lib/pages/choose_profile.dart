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
  bool isEditing = false;

  List<String> profiles = ["Julio", "Pai", "Mãe", "Helena", "Guilherme"];

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
                height: 20,
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
                      setState(() {
                        isEditing = !isEditing;
                      });
                    },
                  )
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              SizedBox(
                  width: double.infinity,
                  child: Text(
                    "Quem está assistindo?",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.subtitle1,
                  )),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.62,
                height: MediaQuery.of(context).size.height,
                child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 20),
                  children: profiles
                      .map((name) => Stack(
                            children: [
                              UserIcon(
                                name: name,
                                onPressed: () {
                                  if (isEditing) {
                                    context.pushNamed(Pages.editProfile.toName,
                                        extra: name);
                                  }
                                },
                                isEditing: isEditing,
                              ),
                            ],
                          ))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

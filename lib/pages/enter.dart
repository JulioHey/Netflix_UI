import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:netflix/router/route_utils.dart';
import 'package:netflix/theme/colors.dart';
import 'package:netflix/utils/assets.dart';
import 'package:netflix/widget/button.dart';

const List<String> titles = [
  "Filmes, séries e muito mais, sem limites",
  "Baixe assita offline",
  "Sem Compromisso",
  "Assita onde quiser"
];
const List<String> subtitles = [
  "Assista onde quiser. Cancele quando quiser.",
  "Tenha sempre algo para assistir offline",
  "Assine hoje, cancele quando quiser.",
  "Assista no celular, tablet, laptop, TV ou outros dispositivos."
];

class EnterPage extends StatefulWidget {
  const EnterPage({super.key});

  @override
  State<EnterPage> createState() => _EnterPageState();
}

class _EnterPageState extends State<EnterPage> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NetflixColors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Container(
            margin: const EdgeInsets.only(left: 20),
            height: 30,
            child: Image.asset(
              NetflixIcons.netflix,
              fit: BoxFit.cover,
            )),
        actions: [
          Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Button(
              child: const Text(
                "PRIVACIDADE",
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              onPressed: () {},
            ),
            const SizedBox(
              width: 15,
            ),
            Button(
              child: const Text(
                "ENTRAR",
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              onPressed: () {
                context.pushNamed(Pages.login.toName);
              },
            ),
            const SizedBox(
              width: 15,
            ),
            Button(
              child: const Icon(Icons.more_vert),
              onPressed: () {},
            ),
            const SizedBox(
              width: 20,
            )
          ])
        ],
      ),
      body: Column(children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.85,
          child: PageView.builder(
              onPageChanged: (page) {
                setState(() {
                  currentPage = page;
                });
              },
              itemCount: 4,
              itemBuilder: ((context, index) => PageViewChild(
                  image: NetflixImages.bgEnterPage1,
                  title: titles[index],
                  subtitle: subtitles[index]))),
        ),
        Center(
          child: SizedBox(
            width: 150,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.circle,
                  size: 20,
                  color: currentPage == 0 ? Colors.white : Colors.grey,
                ),
                Icon(
                  Icons.circle,
                  size: 20,
                  color: currentPage == 1 ? Colors.white : Colors.grey,
                ),
                Icon(
                  Icons.circle,
                  size: 20,
                  color: currentPage == 2 ? Colors.white : Colors.grey,
                ),
                Icon(
                  Icons.circle,
                  size: 20,
                  color: currentPage == 3 ? Colors.white : Colors.grey,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Button(
            onPressed: () {},
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: const Color.fromRGBO(229, 9, 20, 1),
                borderRadius: BorderRadius.circular(8)),
            child: const Center(
                child: Text(
              "VAMOS LÁ",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w700),
            )),
          ),
        )
      ]),
      extendBodyBehindAppBar: true,
    );
  }
}

class PageViewChild extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  const PageViewChild(
      {super.key,
      required this.image,
      required this.subtitle,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                )),
            Positioned(
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(
                    top: 50, left: 80, right: 80, bottom: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.w700,
                            color: Colors.white)),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(subtitle,
                        textAlign: TextAlign.center,
                        style:
                            const TextStyle(fontSize: 20, color: Colors.white)),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}

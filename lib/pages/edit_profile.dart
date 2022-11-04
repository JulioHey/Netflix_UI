import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:netflix/router/route_utils.dart';
import 'package:netflix/theme/colors.dart';
import 'package:netflix/widget/button.dart';
import 'package:netflix/widget/input.dart';
import 'package:netflix/utils/num.dart';
import 'package:netflix/widget/user_splash.dart';

class EditProfile extends StatefulWidget {
  final String name;
  const EditProfile({super.key, this.name = "Julio"});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  late TextEditingController controller;
  late String name;

  bool replay = false;
  @override
  void initState() {
    name = widget.name;
    controller = TextEditingController(text: widget.name);
    controller.addListener(() {
      setState(() {
        name = controller.value.text;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NetflixColors.black,
      appBar: AppBar(
        title: Text(
          "Editar perfil",
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            UserIcon(name: name, isEditing: false, onPressed: () {}),
            10.ph,
            ChangeNameField(controller: controller),
            10.ph,
            EditTile(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (_) => const ClassificationPopUp());
                },
                icon: const Icon(Icons.warning_amber_rounded,
                    color: Colors.white),
                title: "Classificação etária",
                subtitle: "Sem restrições",
                trailling: const Icon(
                  Icons.navigate_next_rounded,
                  color: Colors.white,
                )),
            10.ph,
            EditTile(
                onPressed: () {
                  context.pushNamed(Pages.chooseLanguage.toName, extra: false);
                },
                icon: const Icon(Icons.language, color: Colors.white),
                title: "Idioma de exibição",
                subtitle:
                    "Altere o idioma do texto que você vê na Netflix em todos os aparelhos.",
                trailling: const Icon(
                  Icons.navigate_next_rounded,
                  color: Colors.white,
                )),
            10.ph,
            EditTile(
                onPressed: () {
                  context.pushNamed(Pages.chooseLanguage.toName, extra: true);
                },
                icon: const Icon(Icons.insert_comment_outlined,
                    color: Colors.white),
                title: "Idioma de áudio e legendas",
                subtitle:
                    "Escolha seus idiomas preferidos para assitir a séries e filmes.",
                trailling: const Icon(
                  Icons.navigate_next_rounded,
                  color: Colors.white,
                )),
            10.ph,
            EditTile(
                onPressed: () {
                  context.pushNamed(Pages.legendExibition.toName);
                },
                icon: const Icon(Icons.language, color: Colors.white),
                title: "Exibição das legendas",
                subtitle:
                    "Altere a forma como as legendas aparecem em celulares e tablets.",
                trailling: const Icon(
                  Icons.navigate_next_rounded,
                  color: Colors.white,
                )),
            10.ph,
            EditTile(
                onPressed: () {},
                icon:
                    const Icon(Icons.replay_circle_filled, color: Colors.white),
                title: "Reprodução automática do próximo episódio",
                subtitle: "Em todos aparelhos",
                trailling: NetflixSwitch(
                    value: replay,
                    onChanged: (newValue) {
                      setState(() {
                        replay = newValue;
                      });
                    })),
            10.ph,
            EditTile(
                onPressed: () {},
                icon:
                    const Icon(Icons.replay_circle_filled, color: Colors.white),
                title: "Reprodução automática das prévias",
                subtitle: "Em todos aparelhos",
                trailling: NetflixSwitch(
                    value: replay,
                    onChanged: (newValue) {
                      setState(() {
                        replay = newValue;
                      });
                    })),
            50.ph,
          ],
        )),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: Container(
        width: MediaQuery.of(context).size.width - 32,
        color: Colors.black,
        height: 50,
        child: Button(
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Icon(
              Icons.delete,
              color: Colors.white,
            ),
            Text(
              "Excluir perfil",
              style: Theme.of(context).textTheme.headline1,
            )
          ]),
          onPressed: () {},
        ),
      ),
    );
  }
}

class EditTile extends StatelessWidget {
  final Widget icon;
  final Widget trailling;
  final String title;
  final String subtitle;
  final void Function() onPressed;
  const EditTile(
      {super.key,
      required this.icon,
      required this.title,
      required this.subtitle,
      required this.onPressed,
      required this.trailling});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,
      tileColor: const Color.fromRGBO(54, 54, 54, 1),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      leading: icon,
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: trailling,
    );
  }
}

class NetflixSwitch extends StatelessWidget {
  final bool value;
  final void Function(bool newValue) onChanged;
  const NetflixSwitch(
      {super.key, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: value,
      onChanged: onChanged,
    );
  }
}

class ChangeNameField extends StatelessWidget {
  final TextEditingController controller;
  const ChangeNameField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      decoration: BoxDecoration(
          color: NetflixColors.grey, borderRadius: BorderRadius.circular(8)),
      child: TextFormField(
        controller: controller,
        cursorColor: NetflixColors.grey,
        decoration: const InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 0, color: Colors.transparent)),
          border: OutlineInputBorder(
              borderSide: BorderSide(width: 0, color: Colors.transparent)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 0, color: Colors.transparent)),
        ),
      ),
    );
  }
}

class ClassificationPopUp extends StatelessWidget {
  const ClassificationPopUp({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      backgroundColor: const Color.fromRGBO(55, 55, 55, 1),
      title: Text(
        "Classificação da conta",
        style: Theme.of(context).textTheme.headline1,
      ),
      content: SizedBox(
        height: 280,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(
                  color: NetflixColors.grey,
                  borderRadius: BorderRadius.circular(8)),
              child: Text("TODAS AS CLASSIFICAÇÕES ETÁRIAS",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline4),
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(children: <TextSpan>[
                TextSpan(
                    text: "Mostrar títulos de ",
                    style: Theme.of(context).textTheme.headline4),
                TextSpan(
                    text: "todas as classificações etárias ",
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(fontWeight: FontWeight.w700)),
                TextSpan(
                    text: "neste perfil.",
                    style: Theme.of(context).textTheme.headline4),
              ]),
            ),
            Text(
                "Altere as restrições de visualização na página \"Conta\" do site no Netflix.",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline4),
          ],
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Button(
              child: Text("Cancelar",
                  style: Theme.of(context).textTheme.headline4),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            Button(
              child: Text("Configurações da conta",
                  style: Theme.of(context).textTheme.headline4),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        )
      ],
    );
  }
}

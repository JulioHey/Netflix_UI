import 'package:flutter/material.dart';
import 'package:netflix/theme/colors.dart';
import 'package:netflix/utils/languages.dart';
import 'package:netflix/utils/num.dart';

class ChangeLanguage extends StatefulWidget {
  final bool isCheckbox;
  const ChangeLanguage({super.key, required this.isCheckbox});

  @override
  State<ChangeLanguage> createState() => _ChangeLanguageState();
}

class _ChangeLanguageState extends State<ChangeLanguage> {
  String currentIdiom = "Português";
  List<String> selectedsIdioms = ["Português"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NetflixColors.black,
      appBar: AppBar(
        title: const Text('Exibição'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Text(
                "Altere o dioma do texto que você vê na Netflix. A mudança também será aplicada ao idioma padrão de áudio e legendas.",
                style: Theme.of(context).textTheme.headline4,
              ),
              10.ph,
              ...languages
                  .map((language) => IdiomTileSwitch(
                      idiom: language,
                      isCheckbox: widget.isCheckbox,
                      onPressed: () {
                        setState(() {
                          if (widget.isCheckbox) {
                            if (selectedsIdioms.contains(language)) {
                              selectedsIdioms.remove(language);
                            } else {
                              selectedsIdioms.add(language);
                            }
                          } else {
                            currentIdiom = language;
                          }
                        });
                      },
                      isCurrent: widget.isCheckbox
                          ? selectedsIdioms.contains(language)
                          : language == currentIdiom))
                  .toList()
            ],
          ),
        ),
      ),
    );
  }
}

class IdiomTileSwitch extends StatelessWidget {
  final String idiom;
  final bool isCurrent;
  final bool isCheckbox;
  final void Function() onPressed;
  const IdiomTileSwitch(
      {super.key,
      required this.idiom,
      required this.onPressed,
      required this.isCheckbox,
      required this.isCurrent});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,
      leading: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius:
                isCheckbox ? BorderRadius.zero : BorderRadius.circular(10),
            color: isCurrent ? Colors.red.shade500 : Colors.transparent),
      ),
      title: Text(idiom),
    );
  }
}

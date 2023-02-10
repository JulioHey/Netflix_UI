import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:netflix/theme/colors.dart';
import 'package:netflix/utils/legends.dart';
import 'package:netflix/utils/num.dart';
import 'package:netflix/widget/button.dart';

class LegendExibitionPage extends StatefulWidget {
  const LegendExibitionPage({super.key});

  @override
  State<LegendExibitionPage> createState() => _LegendExibitionPageState();
}

class _LegendExibitionPageState extends State<LegendExibitionPage> {
  List<bool> isSelected = [true, false, false];
  LegendColor selectedColor = LegendsColors.preto;
  TextShadow textShadow = TextShadow.none;
  BordFillColor borderColor = BordFillColor.black;
  BordFillColor fillColor = BordFillColor.none;
  bool fillColorOpacity = false;
  BordFillColor windowColor = BordFillColor.none;
  bool windowColorOpacity = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NetflixColors.black,
      appBar: AppBar(
        title: const Text('Exibição das Legendas'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: <Widget>[
            Text(
              "Altere a forma como as legendas aparecem em celulares e tablets",
              style: Theme.of(context).textTheme.headline4,
            ),
            10.ph,
            Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 200,
                  color: Colors.amber,
                ),
                const Positioned(
                  bottom: 20,
                  right: 20,
                  child: SizedBox(
                    width: 360,
                    child: Text(
                      "Estas configuraçẽos afetam as legendas em celulares e tablets.",
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height - 400,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    10.ph,
                    LegendTile(
                      title: Text("Tamanho do texto"),
                      child: ToggleButtons(
                        selectedColor: NetflixColors.white,
                        fillColor: NetflixColors.grey,
                        isSelected: isSelected,
                        onPressed: (index) {
                          setState(() {
                            for (int i = 0; i < isSelected.length; i++) {
                              isSelected[i] = i == index;
                            }
                          });
                        },
                        children: const <Widget>[
                          Text(
                            "A",
                            style: TextStyle(fontSize: 12),
                          ),
                          Text(
                            "A",
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            "A",
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    10.ph,
                    LegendTile(
                      title: Text("Cor do texto"),
                      child: LegendOptionDropDown(
                        bgColor: selectedColor.textColor,
                        items: LegendsColors.toArray().map((item) {
                          return DropdownMenuItem<LegendColor>(
                            value: item,
                            child: Container(
                              width: 120,
                              height: 60,
                              color: item.textColor,
                              child: Center(
                                child: Text(
                                  item.name,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: item.bgColor,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedColor = value! as LegendColor;
                          });
                        },
                        value: selectedColor,
                      ),
                    ),
                    10.ph,
                    LegendTile(
                        title: Text("Estlo da borda do texto"),
                        child: LegendOptionDropDown(
                          value: textShadow,
                          bgColor: NetflixColors.grey,
                          items: TextShadow.values.map((item) {
                            return DropdownMenuItem<TextShadow>(
                              value: item,
                              child: Container(
                                width: 120,
                                height: 60,
                                color: NetflixColors.grey,
                                child: Center(
                                  child: Text(
                                    item.getString(),
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: NetflixColors.white,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              textShadow = value! as TextShadow;
                            });
                          },
                        )),
                    10.ph,
                    LegendTile(
                        title: Text("Cor da borda do texto"),
                        child: LegendOptionDropDown(
                          value: borderColor,
                          bgColor: borderColor.toColor(),
                          onChanged: (value) {
                            borderColor = value! as BordFillColor;
                          },
                          items: BordFillColorU.valuesWithoutNone().map((item) {
                            return DropdownMenuItem<BordFillColor>(
                                value: item,
                                child: Container(
                                    width: 120,
                                    height: 60,
                                    color: item.toColor(),
                                    child: Center(
                                      child: Text(
                                        item.name(),
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: item.toTextColor(),
                                        ),
                                      ),
                                    )));
                          }).toList(),
                        )),
                    10.ph,
                    Container(
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(54, 54, 54, 1),
                          borderRadius: BorderRadius.circular(8)),
                      child: Column(
                        children: [
                          LegendTile(
                              title: Text("Cor do fundo"),
                              child: LegendOptionDropDown(
                                value: fillColor,
                                bgColor: fillColor.toColor(),
                                onChanged: (value) {
                                  fillColor = value! as BordFillColor;
                                },
                                items: BordFillColor.values.map((item) {
                                  return DropdownMenuItem<BordFillColor>(
                                      value: item,
                                      child: Container(
                                          width: 120,
                                          height: 60,
                                          color: item.toColor(),
                                          child: Center(
                                            child: Text(
                                              item.name(),
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: item.toTextColor(),
                                              ),
                                            ),
                                          )));
                                }).toList(),
                              )),
                          LegendTile(
                              title: Text("Transparencia"),
                              child: Switch(
                                value: fillColorOpacity,
                                onChanged: (value) {
                                  setState(() {
                                    fillColorOpacity = !fillColorOpacity;
                                  });
                                },
                              )),
                        ],
                      ),
                    ),
                    12.ph,
                    Container(
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(54, 54, 54, 1),
                          borderRadius: BorderRadius.circular(8)),
                      child: Column(
                        children: [
                          LegendTile(
                              title: Text("Cor da janela"),
                              child: LegendOptionDropDown(
                                value: windowColor,
                                bgColor: windowColor.toColor(),
                                onChanged: (value) {
                                  windowColor = value! as BordFillColor;
                                },
                                items: BordFillColor.values.map((item) {
                                  return DropdownMenuItem<BordFillColor>(
                                      value: item,
                                      child: Container(
                                          width: 120,
                                          height: 60,
                                          color: item.toColor(),
                                          child: Center(
                                            child: Text(
                                              item.name(),
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: item.toTextColor(),
                                              ),
                                            ),
                                          )));
                                }).toList(),
                              )),
                          LegendTile(
                              title: Text("Transparencia"),
                              child: Switch(
                                value: windowColorOpacity,
                                onChanged: (value) {
                                  setState(() {
                                    windowColorOpacity = !windowColorOpacity;
                                  });
                                },
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 80,
              color: NetflixColors.black,
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Button(
                    decoration: const BoxDecoration(color: NetflixColors.grey),
                    onPressed: () {},
                    child: Container(
                        width: (MediaQuery.of(context).size.width / 2) - 40,
                        alignment: Alignment.center,
                        child: const Text(
                          "Salvar",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: NetflixColors.white),
                        )),
                  ),
                  Button(
                    decoration: const BoxDecoration(color: NetflixColors.grey),
                    onPressed: () {},
                    child: Container(
                        width: (MediaQuery.of(context).size.width / 2) - 40,
                        alignment: Alignment.center,
                        child: const Text(
                          "Redefinir para padrão",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: NetflixColors.white),
                        )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class LegendTile extends StatelessWidget {
  final Widget title;
  final Widget child;
  final BorderRadius borderRadius;

  const LegendTile(
      {super.key,
      required this.title,
      required this.child,
      this.borderRadius = const BorderRadius.only(
        topLeft: Radius.circular(8),
        topRight: Radius.circular(8),
        bottomRight: Radius.circular(8),
        bottomLeft: Radius.circular(8),
      )});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: OutlineInputBorder(borderRadius: borderRadius),
      tileColor: const Color.fromRGBO(54, 54, 54, 1),
      title: title,
      trailing: child,
    );
  }
}

class LegendOptionDropDown extends StatelessWidget {
  final Object value;
  final Color bgColor;
  final List<DropdownMenuItem<Object>> items;
  final void Function(Object?)? onChanged;

  const LegendOptionDropDown(
      {super.key,
      required this.value,
      required this.bgColor,
      required this.items,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 8, top: 5),
      width: 120,
      height: 100,
      child: DropdownButtonFormField2(
        iconSize: 0,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.zero,
        ),
        value: value,
        buttonHeight: 50,
        buttonDecoration: BoxDecoration(
            color: bgColor, borderRadius: BorderRadius.circular(10)),
        buttonPadding: const EdgeInsets.all(0),
        itemPadding: const EdgeInsets.all(0),
        dropdownPadding: const EdgeInsets.all(0),
        dropdownDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        items: items,
        onChanged: onChanged,
      ),
    );
  }
}

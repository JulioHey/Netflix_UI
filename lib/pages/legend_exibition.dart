import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:netflix/theme/colors.dart';
import 'package:netflix/utils/legends.dart';
import 'package:netflix/utils/num.dart';

class LegendExibitionPage extends StatefulWidget {
  const LegendExibitionPage({super.key});

  @override
  State<LegendExibitionPage> createState() => _LegendExibitionPageState();
}

class _LegendExibitionPageState extends State<LegendExibitionPage> {
  List<bool> isSelected = [true, false, false];
  LegendColor selectedColor = LegendsColors.preto;

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
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  LegendTile(
                    title: "Tamanho do texto",
                    child: ToggleButtons(
                      selectedColor: Colors.white,
                      fillColor: Colors.grey,
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
                    title: "Cor do texto",
                    child: Container(
                      padding: const EdgeInsets.only(bottom: 8, top: 5),
                      width: 120,
                      height: 100,
                      child: DropdownButtonFormField2(
                        iconSize: 0,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.zero,
                        ),
                        value: selectedColor,
                        buttonHeight: 50,
                        buttonDecoration: BoxDecoration(
                            color: selectedColor.textColor,
                            borderRadius: BorderRadius.circular(10)),
                        buttonPadding: const EdgeInsets.all(0),
                        itemPadding: const EdgeInsets.all(0),
                        dropdownPadding: const EdgeInsets.all(0),
                        dropdownDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
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
                            selectedColor = value!;
                          });
                        },
                      ),
                    ),
                  )
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
  final String title;
  final Widget child;
  const LegendTile({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      tileColor: const Color.fromRGBO(54, 54, 54, 1),
      title: Text(title),
      trailing: child,
    );
  }
}

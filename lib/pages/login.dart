import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:netflix/pages/splash_screen.dart';
import 'package:netflix/router/route_utils.dart';
import 'package:netflix/theme/colors.dart';
import 'package:netflix/utils/assets.dart';
import 'package:netflix/widget/button.dart';
import 'package:netflix/widget/input.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController nameController = TextEditingController(text: "");
  TextEditingController passwordController = TextEditingController(text: "");

  bool hidePassword = true;
  bool showButton = false;

  bool showSaibaMais = false;

  @override
  void initState() {
    passwordController.addListener(() {
      setState(() {
        showButton = passwordController.text != "";
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: NetflixColors.black,
        title: SizedBox(
            height: 30,
            child: Image.asset(
              NetflixIcons.netflix,
            )),
      ),
      backgroundColor: NetflixColors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 80, left: 16, right: 16),
          child: Form(
              child: Column(children: [
            Input(
              controller: nameController,
              label: "Email ou número de telefone",
            ),
            const SizedBox(
              height: 15,
            ),
            Input(
                controller: passwordController,
                label: "Password",
                password: hidePassword,
                action: Visibility(
                  visible: showButton,
                  child: InkWell(
                    child: Text(
                      hidePassword ? "MOSTRAR" : "OCULTAR",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    onTap: () {
                      setState(() {
                        hidePassword = !hidePassword;
                      });
                    },
                  ),
                )),
            const SizedBox(
              height: 15,
            ),
            Button.outlined(
              onPressed: () {
                showDialog(
                    context: context, builder: (_) => const SplashScreen());
                Future.delayed(const Duration(seconds: 2), () {
                  Navigator.of(context).pop();
                  context.goNamed(Pages.chosseProfile.toName);
                });
              },
              child: Center(
                child: Text("Entrar",
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: Colors.white, fontWeight: FontWeight.w700)),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Button(
              child: Text(
                "Precisa de ajuda?",
                style: Theme.of(context).textTheme.subtitle1,
              ),
              onPressed: () {},
            ),
            const SizedBox(
              height: 15,
            ),
            Button(
              child: Text(
                "Novo por aqui? Inscreva-se agora.",
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(fontWeight: FontWeight.w700),
              ),
              onPressed: () {},
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: Theme.of(context).textTheme.caption,
                children: <TextSpan>[
                  const TextSpan(
                    text:
                        'O acesso está protegido pelo Google reCAPTCHA para garantir que você não é um robô.',
                  ),
                  TextSpan(
                      text: showSaibaMais ? ' Saiba mais.' : "",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          setState(() {
                            showSaibaMais = true;
                          });
                          ;
                        }),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Visibility(
                visible: showSaibaMais,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: Theme.of(context).textTheme.caption,
                    children: <TextSpan>[
                      const TextSpan(
                        text:
                            'As informações recolhidas pelo Google estão sujeitas à ',
                      ),
                      TextSpan(
                          text: 'Política de Privacidade',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              ;
                            }),
                      const TextSpan(text: " e aos "),
                      TextSpan(
                          text: 'Termos de Uso',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                          recognizer: TapGestureRecognizer()..onTap = () {}),
                      const TextSpan(
                          text:
                              " do Google e são usadas para oferecer, manter e melhorar o serviço re CAPTCHA e por questões de segurança(não são usadas para exibir anúncios personalizados pelo Google).")
                    ],
                  ),
                ))
          ])),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mypetcare/helpers/user-man.dart';
import 'package:mypetcare/helpers/user.dart';
import 'package:mypetcare/screens/home.dart';
import 'package:mypetcare/widgets/buttons.dart';
import 'package:mypetcare/widgets/input-widgets.dart';
import 'package:mypetcare/widgets/my-appbar.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/loginPage';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passcontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  void _pushPage() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (BuildContext context) => HomeState()),
      ModalRoute.withName('/home'),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      appBar: loginBar(),
      body: Center(
        child: Form(
          key: formkey,
          child: Consumer<UserManager>(
            builder: (context, userManager, child) {
              return ListView(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                shrinkWrap: true,
                children: [
                  Container(
                    height: 200,
                    child: Image.asset('assets/logo.png'),
                  ),
                  fildEmail(
                    enable: !userManager.loading,
                    controller: emailController,
                    hint: 'E-mail',
                    inputType: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  fildLogin(
                    enable: !userManager.loading,
                    controller: passcontroller,
                    hint: 'Senha',
                    obscure: true,
                  ),
                  forgotButton(),
                  raised(
                      
                      ontap: userManager.loading
                          ? null
                          : () {
                              if (formkey.currentState.validate()) {
                                context.read<UserManager>().singIn(
                                    user: User(
                                      email: emailController.text,
                                      passowrd: passcontroller.text,
                                    ),
                                    onFail: (e) {
                                      scaffoldkey.currentState
                                          .showSnackBar(SnackBar(
                                        content: Text('$e'),
                                        backgroundColor: Colors.red,
                                      ));
                                    },
                                    sucesso: () {
                                      _pushPage();
                                    });
                              }
                            }),
                  SizedBox(
                    height: 10,
                  ),
                  FlatButton(
                      onPressed: () =>
                          Navigator.of(context).popAndPushNamed('/singpage'),
                      child: Text(
                        'Cadastar',
                        style: TextStyle(
                          color: Colors.blue[900],
                        ),
                      ))
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget forgotButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: FlatButton(
        padding: EdgeInsets.zero,
        onPressed: null,
        child: const Text('Esqueci minha Senha'),
      ),
    );
  }
}

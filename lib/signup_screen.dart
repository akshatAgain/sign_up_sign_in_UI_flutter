import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'login_screen.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:sign_button/sign_button.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const SignUpScreen());
  });
}

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _isObscure = false;
  bool _obscure = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blue,
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Container(
              padding:
                  const EdgeInsets.only(left: 20.0, right: 20.0, top: 100.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 70,
                    child: Image.asset(
                      'images/image.png',
                      width: 70.0,
                      height: 70.0,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          autofocus: true,
                          textCapitalization: TextCapitalization.words,
                          keyboardType: TextInputType.name,
                          decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2.0,
                                color: Colors.white,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2.0,
                                color: Colors.white,
                              ),
                            ),
                            fillColor: Colors.white,
                            filled: true,
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.blue,
                            ),
                            hintText: "username",
                            hintStyle: TextStyle(
                              color: Colors.blue,
                              fontSize: 17.0,
                            ),
                          ),
                          textInputAction: TextInputAction.next,
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2.0,
                                color: Colors.white,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2.0,
                                color: Colors.white,
                              ),
                            ),
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.blue,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "email",
                            hintStyle: TextStyle(
                              color: Colors.blue,
                              fontSize: 17.0,
                            ),
                          ),
                          textInputAction: TextInputAction.next,
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        TextFormField(
                          obscureText: !_obscure,
                          decoration: InputDecoration(
                            hintText: 'password',
                            suffixIcon: IconButton(
                              icon: Icon(_obscure
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                setState(
                                  () {
                                    _obscure = !_obscure;
                                  },
                                );
                              },
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: Colors.blue,
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2.0,
                                color: Colors.white,
                              ),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2.0,
                                color: Colors.white,
                              ),
                            ),
                            hintStyle: const TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        FlutterPwValidator(
                          minLength: 8,
                          uppercaseCharCount: 1,
                          numericCharCount: 2,
                          specialCharCount: 1,
                          width: 400,
                          height: 150,
                          onSuccess: () {},
                          controller: _passwordController,
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        TextFormField(
                          controller: _repasswordController,
                          obscureText: !_isObscure,
                          decoration: InputDecoration(
                            helperStyle: const TextStyle(color: Colors.blue),
                            hintText: 'confirm password',
                            hintStyle: const TextStyle(
                              color: Colors.blue,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(_isObscure
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                setState(
                                  () {
                                    _isObscure = !_isObscure;
                                  },
                                );
                              },
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: Colors.blue,
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2.0,
                                color: Colors.white,
                              ),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        RaisedButton(
                          color: Colors.white,
                          elevation: 1.0,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                              side:
                                  BorderSide(color: Colors.white, width: 2.0)),
                          onPressed: () async {},
                          child: const Text(
                            "Sign up",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        FlatButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignInScreen()));
                          },
                          child: const Text(
                            'Already have an Account? Sign in',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Row(
                          children: const <Widget>[
                            Expanded(
                              child: Divider(
                                color: Colors.white,
                                thickness: 1,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "OR",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 17),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: Divider(
                                color: Colors.white,
                                thickness: 1,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SignInButton(
                          btnTextColor: Colors.blue,
                          buttonSize: ButtonSize.small,
                          buttonType: ButtonType.google,
                          onPressed: () {},
                          width: 180,
                        ),
                        const SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void fieldFocusChange(
    BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
  currentFocus.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
}

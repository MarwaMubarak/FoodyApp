import 'package:flutter/material.dart';
import 'package:food_app/bloc/user/user_cubit.dart';
import 'package:food_app/core/components/button_component.dart';
import 'package:food_app/core/navigate.dart';
import 'package:food_app/screens/home_screen.dart';
import 'package:food_app/screens/register_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../core/colors.dart';
import '../core/components/text_field_component.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = UserCubit.get(context);
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Center(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 90,
                  ),
                  const Image(image: AssetImage('assets/images/Foody.png')),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFieldComponent(
                    label: 'Email',
                    controller: _emailController,
                    validator: (value) {},
                    icon: Icons.email,
                    onChangeFun: (value) {},
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFieldComponent(
                    label: 'Password',
                    controller: _passwordController,
                    validator: (value) {},
                    icon: Icons.lock,
                    onChangeFun: (value) {},
                    isPass: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ButtonComponent(
                      width: 150,
                      onPress: () async {
                        if (_formKey.currentState!.validate()) {
                          String email = _emailController.text;
                          String password = _passwordController.text;
                          await cubit.login(email, password, context);
                        }
                      },
                      text: 'Login'),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ButtonComponent(
                          img: "assets/images/google.png",
                          scale: 40,
                          color: grayColor,
                          width: 100,
                          onPress: () async {
                            await cubit.signInWithGoogle(context);
                          },
                          text: ''),
                      ButtonComponent(
                          img: "assets/images/Facebook.png",
                          scale: 30,
                          color: grayColor,
                          width: 100,
                          onPress: () async {
                            await cubit.signInWithFacebook(context);
                          },
                          text: ''),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don\'t have account? ',
                          style: TextStyle(color: baseColor)),
                      TextButton(
                          onPressed: () {
                            Navigate.navigateWithBack(
                                context, RegisterScreen());
                          },
                          child: const Text(
                            'Register',
                            style: TextStyle(color: Colors.grey),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

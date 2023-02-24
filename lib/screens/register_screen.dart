import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_app/bloc/register/register_cubit.dart';
import 'package:food_app/screens/login_screen.dart';

import '../core/colors.dart';
import '../core/components/button_component.dart';
import '../core/components/text_field_component.dart';
import '../core/navigate.dart';

class RegisterScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = RegisterCubit();
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Center(
            child: Form(
              key: _formKey,
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  const SizedBox(
                      height: 150,
                      width: 150,
                      child:
                          Image(image: AssetImage('assets/images/Foody.png'))),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFieldComponent(
                    label: 'Name',
                    controller: _nameController,
                    icon: Icons.person,
                  ),
                  TextFieldComponent(
                    label: 'Phone',
                    controller: _phoneController,
                    icon: Icons.phone,
                  ),
                  TextFieldComponent(
                    label: 'Email',
                    controller: _emailController,
                    icon: Icons.email,
                  ),
                  TextFieldComponent(
                    label: 'Password',
                    controller: _passwordController,
                    icon: Icons.lock,
                    isPass: true,
                  ),
                  TextFieldComponent(
                    label: 'Confirm Password',
                    controller: _confirmPasswordController,
                    validator: (value) {},
                    icon: Icons.lock_open,
                    onChangeFun: (value) {},
                    isPass: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ButtonComponent(
                      width: 150,
                      onPress: () async{
                        String name = _nameController.text;
                        String phone = _phoneController.text;
                        String email = _emailController.text;
                        String password = _passwordController.text;
                        String confirmPassword = _confirmPasswordController.text;
                        if (_formKey.currentState!.validate()) {
                          if (password == confirmPassword) {
                           await cubit.register(email, password, name, phone);
                            if(cubit.responseModel.status){
                              Navigate.navigateAndRemoveAll(
                                  context, LoginScreen());
                            }
                              Fluttertoast.showToast(
                                  msg: cubit.responseModel.message,
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: baseColor,
                                  textColor: Colors.white,
                                  fontSize: 16.0);

                          } else {
                            Fluttertoast.showToast(
                                msg: "Password Doesn't Match",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: baseColor,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          }
                        }
                      },
                      text: 'Register'),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already have account? ',
                          style: TextStyle(color: baseColor)),
                      TextButton(
                          onPressed: () {
                            Navigate.navigateWithBack(context, LoginScreen());
                          },
                          child: const Text(
                            'Login',
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

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telegram/presentation/auth/mixin/auth_mixin.dart';

import '../../main_page/main_page.dart';
import 'bloc/auth_bloc.dart';

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> with AuthMixin{
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (_, state) {
        return StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (_, snapshot) {
            if(snapshot.hasData){
              return MainPage();
            }else {
              return Scaffold(
                appBar: PreferredSize(
                    preferredSize: Size.fromHeight(200),
                    child: Container(
                      decoration: const ShapeDecoration(
                        color: Color(0xFF35B7B7),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(25),
                            bottomRight: Radius.circular(25),
                          ),
                        ),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Icon(
                                    Icons.arrow_back,
                                    size: 35,
                                    color: Colors.white,
                                  ),
                                ),
                              ]
                          ),
                          ListTile(
                            title: Text(
                              'Register',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            subtitle: Text(
                              'Fill up your details to register.',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                ),
                body: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 36),
                          child: TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                              labelText: "Enter your email",
                              labelStyle: const TextStyle(
                                color: Color(0xFF36B8B8),
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                              ),
                              fillColor: Colors.white,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                borderSide: BorderSide(
                                  color: Colors.green,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                borderSide: BorderSide(
                                  color: Color(0xFF36B8B8),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 24),
                          child: TextFormField(
                            controller: passwordController,
                            decoration: InputDecoration(
                              suffixIcon: Icon(Icons.remove_red_eye_outlined),
                              labelText: "Enter your password",
                              labelStyle: const TextStyle(
                                color: Color(0xFF36B8B8),
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                              ),
                              fillColor: Colors.white,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                borderSide: BorderSide(
                                  color: Colors.green,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                borderSide: BorderSide(
                                  color: Color(0xFF36B8B8),
                                ),
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 120),
                          child: GestureDetector(
                            onTap: (){
                              context.read<AuthBloc>().add(SignUpEvent(
                                  email: emailController.text,
                                  password: passwordController.text));
                            },
                            child: Container(
                                width: double.infinity,
                                height: 60,
                                decoration: ShapeDecoration(
                                  color: Color(0xFF36B8B8),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                child: const Center(
                                  child: Text(
                                    'Register',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                )
                            ),
                          ),
                        ),


                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          child: Text.rich(
                              TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Already have an account ',
                                      style: TextStyle(
                                        color: Color(0xCC191919),
                                        fontSize: 12,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'Login',
                                      style: TextStyle(
                                        color: Color(0xFF35B7B7),
                                        fontSize: 12,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )
                                  ]
                              )
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }
          }
        );
      },
    );
  }
}

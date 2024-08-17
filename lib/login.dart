import 'package:flutter/material.dart';
import 'package:sample/home.dart';
import 'package:sample/service.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(onPressed: ()async{
          final result =await  Service().login();
          if(result){
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen(),));
          }

            }, child: Text('Login')),
          )
        ],
      ),
    );
  }
}
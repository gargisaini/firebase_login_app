import 'package:firebase_login_app/auth_controller.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  String? email;
  WelcomePage({Key? key,required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
        width: w,
        height: h*0.35,
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage("img/signup.png"),
              fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            SizedBox(height: h*0.16,),
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.white70,
              backgroundImage: AssetImage("img/profile1.png"),
            )
          ],
        ),

      ),
          SizedBox(height: 60,),
          Container(
            width: w,
            margin: EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Welcome",style: TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),),
                Text(email!,style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey[500],
                ),),
              ],
            ),
          ),
          SizedBox(height: 150,),
          GestureDetector(
            onTap: (){
              AuthController.instance.logOut();
            },
            child: Container(
              width: w*0.4,
              height:h*0.08,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(image: AssetImage("img/loginbtn.png"),
                    fit: BoxFit.cover),
              ),
              alignment: Alignment.center,
              child: Text("Sign Out",style: TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),),

            ),
          ),

  ]));
  }
}

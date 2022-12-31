import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List images = [
      "g.png",
      "t.png",
      "f.png"
    ];

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
          SizedBox(height: 50,),
          Container(
            margin: EdgeInsets.only(left: 20,right: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    spreadRadius: 7,
                    offset: Offset(1,1),
                    color: Colors.grey.withOpacity(0.2),
                  )
                ]
            ),
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Enter E-mail",
                  prefixIcon: Icon(Icons.email,color: Colors.orangeAccent,),
                  focusedBorder:  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                        color: Colors.white
                    ),
                  ),
                  enabledBorder:  OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 1.0,
                      )
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)
                  )
              ),
            ),
          ),
          SizedBox(height: 25,),
          Container(
            margin: EdgeInsets.only(left: 20,right: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    spreadRadius: 7,
                    offset: Offset(1,1),
                    color: Colors.grey.withOpacity(0.2),
                  )
                ]
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Enter Password",
                  prefixIcon: Icon(Icons.password,color: Colors.orangeAccent,),
                  focusedBorder:  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                        color: Colors.white
                    ),
                  ),
                  enabledBorder:  OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 1.0,
                      )
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)
                  )
              ),
            ),
          ),
          SizedBox(height: 40,),
          Container(
            width: w*0.4,
            height:h*0.08,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              image: DecorationImage(image: AssetImage("img/loginbtn.png"),
                  fit: BoxFit.cover),
            ),
            alignment: Alignment.center,
            child: Text("Sign Up",style: TextStyle(
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),),

          ),
          SizedBox(height: 10,),
          RichText(text: TextSpan(
            recognizer: TapGestureRecognizer()..onTap=()=>Get.back(),
            text: "Have an Account?",
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            )
          )),
          SizedBox(height: h*0.06,),
          RichText(text: TextSpan(
              text: "Sign up using one of the following methods",
              style: TextStyle(
                color: Colors.grey[500],
                fontSize: 15,
              ),
          ),),
          Wrap(
            children: List<Widget>.generate(3, (index) {
              return CircleAvatar(
                radius: 38,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 22,
                  backgroundImage: AssetImage(
                    "img/"+images[index],
                  ),

                ),
              );
            }),
          ),


  ])

    );
  }
}

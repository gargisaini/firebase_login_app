import 'package:firebase_login_app/auth_controller.dart';
import 'package:firebase_login_app/signup_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
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
            height: h*0.3,
            decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage("img/loginimg.png"),
              fit: BoxFit.cover),
            ),

          ),
          Container(
            width:  w,
            margin: const EdgeInsets.only(left: 20,right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Hello',style: TextStyle(
                  fontSize: 60,
                  letterSpacing: 2,
                  fontWeight: FontWeight.bold,
                ),),
                Text('Sign into Your Account',style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[500],
                ),),
                const SizedBox(height: 40,),
                Container(
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
                    controller: emailController,
                    decoration: InputDecoration(
                        hintText: "Email",
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
                SizedBox(height: 20,),
                Container(
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
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: "Password",
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
                SizedBox(height: 20,),
                Row(
                  children: [
                    //empty containter to to move text to right
                    Expanded(child: Container(),),
                    Text('Forget Your Password',style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[500],
                    ),),
                  ],
                ),

              ],
            ),
          ),
          SizedBox(height: 40,),
          GestureDetector(
            onTap: (){
              AuthController.instance.login(emailController.text, passwordController.text);
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
              child: Text("Sign In",style: TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),),

            ),
          ),
          SizedBox(height: h*0.08,),
          RichText(text: TextSpan(
            text: "Don't have an Account?",
            style: TextStyle(
              color: Colors.grey[500],
              fontSize: 15,
            ),
            children: [
              TextSpan(
                text: " Create",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  fontSize: 15,
                ),
                recognizer: TapGestureRecognizer()..onTap=()=>Get.to(()=>SignUpPage())
              ),

            ]
          ),)

        ],
      ),

    );
  }
}

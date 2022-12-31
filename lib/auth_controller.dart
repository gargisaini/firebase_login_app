import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_login_app/login_page.dart';
import 'package:firebase_login_app/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{
  // So the auth controller can be acces through globly becox we want every page to have auth acces
  static AuthController instance = Get.find();
  // this firebase variable which will have users email,password,name....
  late Rx<User?> _user;
  // using auth we acsses lots of property from firebase
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    //keep track of user activity in the app or it will notify the user or app
    _user.bindStream(auth.userChanges());
    //app need to notifyed if teh user has logged in or logged out we use ever funation as listener for it
    ever(_user, _initialScreen);

  }

  _initialScreen(User? user){
    if(user==null){
      print("login page");
      Get.offAll(()=>LoginPage());
    }else{
      Get.offAll(()=>WelcomePage(email:user.email));
    }
  }

  void register(String email,password) async {
    try{
     await auth.createUserWithEmailAndPassword(email: email, password: password);
    }catch(e){
      Get.snackbar("About User", "User message",
      backgroundColor: Colors.redAccent,
        snackPosition: SnackPosition.BOTTOM,
        titleText: Text("Account Creation Failed ",style: TextStyle(
          color: Colors.white,
        ),),
        messageText: Text(e.toString(),style: TextStyle(color: Colors.white),)
      );
    }
  }
  void login(String email,password) async {
    try{
      await auth.signInWithEmailAndPassword(email: email, password: password);
    }catch(e){
      Get.snackbar("About Login", "Login message",
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text("Login Failed ",style: TextStyle(
            color: Colors.white,
          ),),
          messageText: Text(e.toString(),style: TextStyle(color: Colors.white),)
      );
    }
  }
  void logOut() async {
    await auth.signOut();
  }
}
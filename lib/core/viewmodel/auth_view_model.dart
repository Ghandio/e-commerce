import 'package:b_store/view/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class AuthViewModel extends GetxController {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  FirebaseAuth _auth = FirebaseAuth.instance;
  FacebookAuth _facebookAuth = FacebookAuth.instance;
  late String email, password, name;
    Rxn<User> _user=Rxn<User>();
    String? get user=>_user.value?.email;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  //  login with google account first then store the Authentication into an GoogleSignInAuth variable then will
  // get the credentials from this variable and store it in an AuthCred variable then pass it to the firebase
  // instance to store it
  void googleSignInMethod() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    print(googleUser);
    GoogleSignInAuthentication? googleSignInAuthentication =
        await googleUser?.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication?.idToken,
      accessToken: googleSignInAuthentication?.accessToken,
    );
    await _auth.signInWithCredential(credential);
  }

  //login using facebook using email and save the result in a LoginResult then get the token from access token of result
  //variable and then check if the status of it is success then we will get the login credentials and save it into
  //firebase instance
  void facebookSignIn() async {
    final LoginResult result =
        await _facebookAuth.login(permissions: ['email']);
    final accessToken = result.accessToken?.token;
    if (result.status == LoginStatus.success) {
      final faceCred = FacebookAuthProvider.credential(accessToken!);
      await _auth.signInWithCredential(faceCred);
    }
  }

  //Login with email and password
  void emailAndPasswordSignIn() async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.offAll(HomeScreen());
    } catch (e) {
      print(e);
      Get.snackbar('Login Error', e.toString(),
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }
  }
}

import 'package:b_store/core/services/firestore_user.dart';
import 'package:b_store/helper/local_storage_data.dart';
import 'package:b_store/model/user_model.dart';
import 'package:b_store/view/auth/login_screen.dart';
import 'package:b_store/view/control_view.dart';
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
  late String email, password;
  String? name;
  Rxn<User> _user = Rxn<User>();

  String? get user => _user.value?.email;
  final LocalStorageData localStorageData = Get.find();

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
    await _auth.signInWithCredential(credential).then((value) {
      saveUser(value);
      Get.offAll(ControlView());
    });
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
      await _auth.signInWithCredential(faceCred).then((value) async {
        saveUser(value);
        Get.offAll(HomeScreen());
      });
    }
  }

  //Login with email and password
  void emailAndPasswordSignIn() async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        await FireStoreUser().getCurrentUser(value.user!.uid).then((value) {
          setUser(UserModel.fromJson(value.data() as Map<dynamic, dynamic>));
        });
      });
      Get.offAll(ControlView());
    } catch (e) {
      print(e);
      Get.snackbar('Login Error', e.toString(),
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }
  }

  void SignUpWithEmailAndPassword() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        saveUser(value);
      });

      Get.offAll(ControlView());
    } catch (e) {
      print(e);
      Get.snackbar('Login Error', e.toString(),
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }
  }

  void saveUser(UserCredential value) async {
    UserModel userModel = UserModel(
      userId: value.user?.uid,
      email: value.user?.email,
      name: getName(value),
      pic: value.user?.photoURL,
    );
    await FireStoreUser().addUserToFireStore(userModel);
    setUser(userModel);
  }

  String? getName(UserCredential value) {
    if (value.user?.displayName != null) {
      return name = value.user?.displayName;
    } else {
      return name = name;
    }
  }

  void setUser(UserModel userModel) async {
    await localStorageData.setUser(userModel);
  }
}

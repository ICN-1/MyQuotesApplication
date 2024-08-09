import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_quotes_application/routes/routes.dart';

class LoginAndSignupPageController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final RxBool _isTextHidden = true.obs;
  bool get isTextHidden => _isTextHidden.value;

  Future<void> createAccount(GlobalKey<FormState> formKey, String username, String email, String phone, String password) async{
    final isCreated = formKey.currentState?.validate();
    if (isCreated!) {
      try {
        formKey.currentState?.save();
        UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: email, 
          password: password
        );

        DocumentReference documentReference = _firestore.collection("Users Details").doc(userCredential.user!.uid);
        Map<String, Object> usersMap = {
          "Username": username,
          "Email Address": email,
          "Phone Number": phone,
          "Password": password,
          "Created": Timestamp.now()
        };

        await documentReference.set(usersMap);
        Get.snackbar("Successful", "$email account created!");
        Get.offAndToNamed(AppRoutes.mainMenuPageRoute);

      } on FirebaseAuthException catch (e) {
        if (e.code == "weak-password") {
          Get.snackbar("Error", "The password you provided is too weak!");
        }else if (e.code == "email-already-in-use") {
          Get.snackbar("Error", "An account already exists with that email!");
        }else{
          Get.snackbar("Error", "$e. Please try again!");
        }
      } catch (e){
        Get.snackbar("Error", "$e. Please try again!");
      }
    }
  }

  Future<void> loginAccount(GlobalKey<FormState> formKey, String email, String password) async{
    final isCreated = formKey.currentState?.validate();
    if (isCreated!) {
      try {
        formKey.currentState?.save();
        await _auth.signInWithEmailAndPassword(
          email: email, 
          password: password
        );

        Get.snackbar("Successful", "$email signed in!");
        Get.offAndToNamed(AppRoutes.mainMenuPageRoute);

      } on FirebaseAuthException catch (e) {
        if (e.code == "weak-password") {
          Get.snackbar("Error", "The password you provided is too weak!");
        }else if (e.code == "email-already-in-use") {
          Get.snackbar("Error", "An account already exists with that email!");
        }else{
          Get.snackbar("Error", "$e. Please try again!");
        }
      } catch (e){
        Get.snackbar("Error", "$e. Please try again!");
      }
    }
  }

  void setHiddentextState(bool isPassword){
    if (isPassword) {
      _isTextHidden.value = !_isTextHidden.value;
    }else{
      _isTextHidden.value = false;
    }
  }
}
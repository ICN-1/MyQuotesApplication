import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;

class ProfilePageController extends GetxController {
  @override
  void onInit() {
    getUserDetails();

    super.onInit();
  }

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseStorage storage = FirebaseStorage.instance;
  late File imageFile;

  final RxString _imageUrl = "".obs;
  String get imageUrl => _imageUrl.value;

  final RxString _firstName = "".obs;
  String get firstName => _firstName.value;

  final RxString _lastName = "".obs;
  String get lastName => _lastName.value;

  final RxString _username = "".obs;
  String get username => _username.value;

  final RxString _emailAddress = "".obs;
  String get emailAddress => _emailAddress.value;

  final RxString _phoneNumber = "".obs;
  String get phoneNumber => _phoneNumber.value;

  

  Future<void> pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
    }
  }

  Future<void> getUserDetails() async{
    String userId = firebaseAuth.currentUser!.uid;
    
    firestore.collection("Users Details").doc(userId).get().then((DocumentSnapshot documentSnapshot){
      if (documentSnapshot.exists) {
        _firstName.value = documentSnapshot.get("First Name");
        _lastName.value = documentSnapshot.get("Last Name");
        _username.value = documentSnapshot.get("Username");
        _emailAddress.value = documentSnapshot.get("Email Address");
        _phoneNumber.value = documentSnapshot.get("Phone Number");
        _imageUrl.value = documentSnapshot.get("Image");
      }
    }).catchError((error){
      Get.snackbar("Error", "Message: $error");
    });
  }

  Future<void> saveUserDetails(formKey, firstName, lastName, username, emailAddress, phoneNumber, String password) async{
    User? userId = firebaseAuth.currentUser;
    final isCreated = formKey.currentState?.validate();

    if (isCreated!) {
      await _uploadImage(imageFile);
      DocumentReference documentReference = firestore.collection("Users Details").doc(userId!.uid);
      Map<String, Object> user = {
        "First Name": firstName,
        "Last Name": lastName,
        "Username": username,
        "Email Address": emailAddress,
        "Phone Number": phoneNumber,
      };

      documentReference.update(user).then((_){
        if (password.isNotEmpty) {
          userId.verifyBeforeUpdateEmail(emailAddress).then((_){
            getUserDetails();
          Get.snackbar("Successful", "$emailAddress account updated successfully");
        }).catchError((error){
          Get.snackbar("Error", "Message: $error");
        });
      }
      }).catchError((error){
        Get.snackbar("Update Failure", "Message: $error");
      });
    }
  }

  Future<void> _uploadImage(File imageFile) async {
    try {
      String userId = firebaseAuth.currentUser!.uid;
      String fileName = Path.basename(imageFile.path);
      Reference storageRef = storage.ref().child("user_images/$userId/$fileName");
      UploadTask uploadTask = storageRef.putFile(imageFile);

      final TaskSnapshot downloadUrl = (await uploadTask);
      String url = await downloadUrl.ref.getDownloadURL();
      
      firestore.collection("Users Details").doc(userId).update({
        "Image": url,
      });

      _imageUrl.value = url;
      Get.snackbar("Success", "Profile image updated successfully!");
    } catch (e) {
      Get.snackbar("Error", "Failed to update profile image: $e");
    }
  }
}
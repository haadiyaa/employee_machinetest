import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:machinetest_web/resources/appcolors.dart';
import 'package:machinetest_web/view/dashboard/dashboard.dart';
import 'package:machinetest_web/view/login/login.dart';
class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  Rx<User?> _firebaseUser = Rx<User?>(null);
  User? get user => _firebaseUser.value;
  late UserCredential userCredential;

  var loading = false.obs;
  var isLoading = false.obs;

/// Checking the login status of the user on initialization
  @override
  void onInit() {
    super.onInit();
    _firebaseUser.bindStream(_auth.authStateChanges());
    ever(_firebaseUser, (_) {
      isLoading.value = false;
    });
  }

/// Registering  the user in firbase authentication and firestore datebase
  void createUser(String name, String email, String password) async {
    try {
      loading.value = true;
      CollectionReference reference =
          FirebaseFirestore.instance.collection("Users");
      userCredential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      await reference.doc(userCredential.user!.uid).set({
        'name': name,
        'email': email,
      });
      Get.offAll(() => const Login());

      loading.value = false;
    } catch (e) {
      Get.snackbar("erro creating account", e.toString());
      loading.value = false;
    }
  }

///Login functionality for registered users
  void logIn(String email, String password) async {
    try {
      userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      Get.offAll(() => const DashBoard());
    } catch (e) {
      Get.snackbar("Error while logging in", e.toString(),backgroundColor:AppColors.red);
    }
  }

///logout funtion 
  Future<void> signOut() async {
    await _auth.signOut().then((value) => Get.offAll(() => const Login())).then((value) {
      Get.snackbar('Logged Out!', 'Successful');
    },);
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:startyo/data/category.enum.dart';
import 'package:startyo/data/loginState.enum.dart';
import 'package:startyo/data/models/user.model.dart';
import 'package:startyo/data/phase.enu.dart';
import 'package:startyo/data/role.enum.dart';

class AuthProvider with ChangeNotifier {
  AuthLoginState _authLoginState = AuthLoginState.login;
  final FirebaseAuth _authInstance = FirebaseAuth.instance;
  final FirebaseFirestore _firestoreInstance = FirebaseFirestore.instance;
  late StartUp _startUp;
  late Mentor _mentor;

  StartUp get startUp => _startUp;
  Mentor get mentor => _mentor;

  String? currPass = "";

  AuthLoginState get authLoginState => _authLoginState;
  void setAuthLoginState(AuthLoginState state) {
    _authLoginState = state;
    notifyListeners();
  }

  Future<void> loginAsStartUp(String email, String password) async {
    try {
      _authLoginState = AuthLoginState.loading;
      final credential = await _authInstance.signInWithEmailAndPassword(
          email: email, password: password);
      final userDocument =
          _firestoreInstance.collection(Role.startUp.toString()).where(
                'userId',
                isEqualTo: credential.user?.uid,
              ) as StartUp;
      _startUp = StartUp(
        companyName: userDocument.companyName,
        userId: userDocument.userId,
        fullName: userDocument.fullName,
        phone: userDocument.phone,
        email: userDocument.email,
        role: userDocument.role,
        idea: userDocument.idea,
        phase: userDocument.phase,
        valuation: userDocument.valuation,
        category: userDocument.category,
      );
      _authLoginState = AuthLoginState.loggedIn;
      notifyListeners();
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }

  Future<void> signUpAsStartUp(
      String email,
      String password,
      String fullName,
      int phone,
      Role role,
      String idea,
      Phase phase,
      double valuation,
      String companyName,
      DomainCategory category) async {
    //TODO: Accept On Error function to put in catch block
    _authLoginState = AuthLoginState.loading;
    try {
      final credentials = await _authInstance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = credentials.user;
      await user?.updateDisplayName(fullName);
      final collectionName = role.toString().toLowerCase();
      final res =
          await _firestoreInstance.collection("startUps").add(<String, dynamic>{
        'userId': user?.uid,
        'email': email,
        'fullName': fullName,
        'phone': phone,
        'role': role.toString(),
        'idea': idea,
        'phase': phase.toString(),
        'valuation': valuation,
        "companyName": companyName,
        'category': category.toString()
      });

      _startUp = StartUp(
        companyName: companyName,
        userId: user?.uid,
        fullName: fullName,
        phone: phone,
        email: email,
        role: role,
        idea: idea,
        phase: phase,
        valuation: valuation,
        category: category,
      );

      _authLoginState = AuthLoginState.loggedIn;
      notifyListeners();
      print(res);
    } on FirebaseAuthException catch (e) {
      print(e.message);
    } catch (error) {
      print(error);
    }
    notifyListeners();
    _authLoginState = AuthLoginState.login;
  }

  void setCurrPass(String password) {
    currPass = password;
  }

  void setLocalState(
    String email,
    String fullName,
    int phone,
    Role role,
    String idea,
    Phase phase,
    double valuation,
    String companyName,
    DomainCategory category,
  ) {
    // print(email +
    //     password +
    //     fullName +
    //     phone.toString() +
    //     role.toString() +
    //     idea.toString() +
    //     phase.toString() +
    //     valuation.toString() +
    //     companyName +
    //     category.toString());
    _startUp = StartUp(
      companyName: companyName,
      fullName: fullName,
      userId: "placeholder",
      phone: phone,
      email: email,
      role: role,
      idea: idea,
      phase: phase,
      valuation: valuation,
      category: category,
    );
  }

  void switchToSignUp() {
    _authLoginState = AuthLoginState.signUp;
    notifyListeners();
  }
}

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quizz_app/HTTP/api.dart';

String exp = "";
String about = "";

getProfileInfo(providerValue) async {
  //String? userName = FirebaseAuth.instance.currentUser?.email.toString();

  //FirebaseFirestore.instance.collection("users").doc(userName).get();
  Map<String, dynamic> userdata = {
    "email": Local.username,
  };
  final respone =
      await requestHttp('getUser', 'POST', body: json.encode(userdata));
  Map<String, dynamic> responseData = json.decode(respone.body);

  responseData.forEach((key, value) {
    if (key == "experience") {
      providerValue.getExperience(value);
    } else if (key == "about") {
      providerValue.getAbout(value);
    } else if (key == "qualification") {
      providerValue.getQualification(value);
    } else if (key == "contact") {
      providerValue.getUserPhone(value);
    } else if (key == "userType") {
      providerValue.getUserType(value);
    } else if (key == "name") {
      providerValue.getUserName(value);
    }
  });
}

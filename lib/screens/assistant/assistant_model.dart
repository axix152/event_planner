import 'package:event_planner/global.dart';
import 'package:event_planner/models/userModel.dart';
import 'package:firebase_database/firebase_database.dart';

class AssistantModel {
  static void readCurrentUserInfo() {
    currentFirebaseUser = fauth.currentUser;
    DatabaseReference userref = FirebaseDatabase.instance
        .ref()
        .child("users")
        .child(currentFirebaseUser!.uid);

    userref.once().then((snap) {
      if (snap.snapshot.value != null) {
        userModel = UserModel.fromJson(snap.snapshot);
        print("Name " + userModel!.name.toString());
        // ignore: prefer_interpolation_to_compose_strings, avoid_print
        print("email " + userModel!.email.toString());
      } else {
        print("no data");
      }
    });
  }
}

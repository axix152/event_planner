import 'package:event_planner/models/userModel.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth fauth = FirebaseAuth.instance;

User? currentFirebaseUser;
UserModel? userModel;

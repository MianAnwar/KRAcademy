import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kacademy/Objects_Layer/LoginCredentials.dart';

class OnlineDBUserServices {
  final CollectionReference dataCollection =
      FirebaseFirestore.instance.collection("users");

  ////////< Online DB CRUD operations >//////////
  Future insertNewUserCredentials(LoginCredentials cred) async {
    final CollectionReference usersRef =
        FirebaseFirestore.instance.collection('users');
    return await usersRef.doc(cred.phoneNo).set({
      'phoneno': cred.phoneNo,
      'pwd': cred.pwd,
      'who': cred.who,
    });
  }

  Future updateUserCredentials(LoginCredentials cred) async {
    final CollectionReference usersRef =
        FirebaseFirestore.instance.collection('users');
    final doc = await usersRef.doc(cred.phoneNo).get();
    if (doc.exists) {
      doc.reference.update({
        'phoneno': cred.phoneNo,
        'pwd': cred.pwd,
        'who': cred.who,
      });
    }
  }

  Future deleteUserCredentials(LoginCredentials cred) async {
    final CollectionReference usersRef =
        FirebaseFirestore.instance.collection('users');
    final doc = await usersRef.doc(cred.phoneNo).get();
    if (doc.exists) {
      doc.reference.delete();
    }
  }

  Future<int> getCount() async {
    int i = 0;
    final CollectionReference usersRef =
        FirebaseFirestore.instance.collection('users');
    final QuerySnapshot snapshot = await usersRef.get();
    snapshot.docs.forEach((DocumentSnapshot doc) {
      i++;
    });
    return i;
  }

  Future<LoginCredentials> getloginCredentials(String phno) async {
    final CollectionReference usersRef =
        FirebaseFirestore.instance.collection('users');
    final DocumentSnapshot doc = await usersRef.doc(phno).get();
    if (doc.exists) {
      return LoginCredentials.fromMapObj(doc.data());
    }
    return null;
  }
}

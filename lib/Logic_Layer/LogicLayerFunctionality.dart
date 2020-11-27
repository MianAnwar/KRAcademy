import 'package:kacademy/Objects_Layer/LoginCredentials.dart';

class LogicLayerFunctionality {
  //------------------------------------------------------------//
  /// make this class a SINGLETON
  factory LogicLayerFunctionality() {
    if (llf == null) {
      llf = LogicLayerFunctionality.createInstance();
    }
    return llf;
  }
  LogicLayerFunctionality.createInstance();
  static LogicLayerFunctionality llf;
//------------------------------------------------------------//

//------------------------------------------------------------//
  Future getVerifyLoginCredentials(LoginCredentials cred) {
    // if correct loginCredentials than return 0;
    // if incorrect loginCredentials than return 1;
    //        using Firebase
    return Future.delayed(Duration(seconds: 2), () {
      //return 1; //incorrect
      return 0; //correct
    });
  }
  //------------------------------------------------------------//

  //------------------------------------------------------------//
}

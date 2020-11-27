class LoginCredentials {
  LoginCredentials(this.phoneNo, this.pwd, this.who);
  int id;
  String phoneNo;
  String pwd;
  String who; // Admin, Faculty or Student

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['id'] = this.id;
    map['phoneno'] = this.phoneNo;
    map['pwd'] = this.pwd;
    map['who'] = this.who;
    return map;
  }

  LoginCredentials.fromMapObj(Map<String, dynamic> map) {
    this.id = map['id'];
    this.phoneNo = map['phoneno'];
    this.pwd = map['pwd'];
    this.who = map['who'];
  }
}

class Teacher {
  Teacher.instance();
  Teacher(
    this._fullname,
    this._fathername,
    this._age,
    this._majorsubject1,
    this._majorsubject2,
    this._class1,
    this._class2,
    this._class3,
    this._class4,
    this._cnic,
    this._currentaddress,
    this._gender,
    this._contactno1,
    this._contactno2,
  );

  String _id;
  String _fullname;
  String _fathername;
  String _age;
  String _majorsubject1;
  String _majorsubject2;
  String _class1;
  String _class2;
  String _class3;
  String _class4;
  String _cnic;
  String _currentaddress;
  String _gender;
  String _contactno1;
  String _contactno2;

  String get id => _id;

  set id(String id) {
    this._id = id;
  }

  String get fullName => _fullname;

  set fullName(String fullname) {
    this._fullname = fullname;
  }

  String get fatherName => _fathername;

  set fatherName(String fathername) {
    this._fathername = fathername;
  }

  String get age => _age;

  set age(String age) {
    this._age = age;
  }

  String get majorsubject1 => _majorsubject1;

  set majorsubject1(String majorsubject) {
    this._majorsubject1 = majorsubject;
  }

  String get majorsubject2 => _majorsubject2;

  set majorsubject2(String majorsubject) {
    this._majorsubject2 = majorsubject;
  }

  String get class1 => _class1;

  set class1(String class1) {
    this._class1 = class1;
  }

  String get class2 => _class2;

  set class2(String class2) {
    this._class2 = class2;
  }

  String get class3 => _class3;

  set class3(String class3) {
    this._class3 = class3;
  }

  String get class4 => _class4;

  set class4(String class4) {
    this._class4 = class4;
  }

  String get cnic => _cnic;

  set cnic(String cnic) {
    this._cnic = cnic;
  }

  String get currentaddress => _currentaddress;

  set currentaddress(String currentaddress) {
    this._currentaddress = currentaddress;
  }

  String get gender => _gender;

  set gender(String gender) {
    this._gender = gender;
  }

  String get contactno1 => _contactno1;

  set contactno1(String contactno1) {
    this._contactno1 = contactno1;
  }

  String get contactno2 => _contactno2;

  set contactno2(String contactno2) {
    this._contactno2 = contactno2;
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['id'] = this.id;
    map['fullname'] = this.fullName;
    map['fathername'] = this.fatherName;

    map['majorsubject1'] = this.majorsubject1;
    map['majorsubject2'] = this.majorsubject2;

    map['class1'] = this.class1;
    map['class2'] = this.class2;
    map['class3'] = this.class3;
    map['class4'] = this.class4;

    map['age'] = this.age;
    map['cnic'] = this.cnic;
    map['gender'] = this.gender;
    map['currentaddress'] = this.currentaddress;

    map['contactno1'] = this.contactno1;
    map['contactno2'] = this.contactno2;
    return map;
  }

  Teacher.fromMapObj(Map<String, dynamic> map) {
    this.id = map['id'];
    this.fullName = map['fullname'];
    this.fatherName = map['fathername'];

    this.majorsubject1 = map['majorsubject1'];
    this.majorsubject2 = map['majorsubject2'];

    this.class1 = map['class1'];
    this.class2 = map['class2'];
    this.class3 = map['class3'];
    this.class4 = map['class4'];

    this.age = map['age'];
    this.cnic = map['cnic'];
    this.gender = map['gender'];
    this.currentaddress = map['currentaddress'];

    this.contactno1 = map['contactno1'];
    this.contactno2 = map['contactno2'];
  }
}

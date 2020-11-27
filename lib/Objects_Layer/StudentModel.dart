class Student {
  Student.instance();
  Student(
    this._fullname,
    this._fathername,
    this._classstudy,
    this._age,
    this._majorsubject,
    this._cnic,
    this._currentaddress,
    this._gender,
    this._fatherphoneno,
    this._alternativephoneno,
  );

  String _rollno;
  String _fullname;
  String _fathername;
  String _classstudy;
  String _age;
  String _majorsubject;
  String _cnic;
  String _currentaddress;
  String _gender;
  String _fatherphoneno;
  String _alternativephoneno;

  String get rollNo => _rollno;

  set rollNo(String rollNo) {
    this._rollno = rollNo;
  }

  String get fullName => this._fullname;

  set fullName(String fullName) {
    this._fullname = fullName;
  }

  String get fatherName => this._fathername;

  set fatherName(String fatherName) {
    _fathername = fatherName;
  }

  String get classStudy => _classstudy;

  set classStudy(String classStudy) {
    this._classstudy = classStudy;
  }

  String get age => this._age;

  set age(String age) {
    this._age = age;
  }

  String get majorSubject => this._majorsubject;

  set majorSubject(String majorSubject) {
    this._majorsubject = majorSubject;
  }

  String get cnic => this._cnic;

  set cnic(String cnic) {
    this._cnic = cnic;
  }

  String get currentAddress => _currentaddress;

  set currentAddress(String currentAddress) {
    this._currentaddress = currentAddress;
  }

  String get gender => this._gender;

  set gender(String gender) {
    this._gender = gender;
  }

  String get fatherPhoneNo => this._fatherphoneno;

  set fatherPhoneNo(String fatherPhoneNo) {
    this._fatherphoneno = fatherPhoneNo;
  }

  String get alternativePhoneNo => this._alternativephoneno;

  set alternativePhoneNo(String alternativePhoneNo) {
    this._alternativephoneno = alternativePhoneNo;
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['rollno'] = this.rollNo;
    map['fullname'] = this.fullName;
    map['fathername'] = this.fatherName;
    map['classstudy'] = this.classStudy;
    map['age'] = this.age;
    map['majorsubject'] = this.majorSubject;
    map['cnic'] = this.cnic;
    map['currentaddress'] = this.currentAddress;
    map['gender'] = this.gender;
    map['fatherphoneno'] = this.fatherPhoneNo;
    map['altphoneno'] = this.alternativePhoneNo;
    return map;
  }

  Student.fromMapObj(Map<String, dynamic> map) {
    this.rollNo = map['rollno'];
    this.fullName = map['fullname'];
    this.fatherName = map['fathername'];
    this.classStudy = map['classstudy'];
    this.age = map['age'];
    this.majorSubject = map['majorsubject'];
    this.cnic = map['cnic'];
    this.currentAddress = map['currentaddress'];
    this.gender = map['gender'];
    this.fatherPhoneNo = map['fatherphoneno'];
    this.alternativePhoneNo = map['altphoneno'];
  }
}

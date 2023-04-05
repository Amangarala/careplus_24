class ProfileModel {
  String? uid;
  String? email;

  String? name;
  String? username;
  String? phoneNumber;
  String? qualification;
  String? dob;
  String? bloodType;
  String? country;
  String? state;
  String? city;
  String? address;
  String? age;

  ProfileModel(
      {this.uid,
      this.name,
      this.email,
      this.username,
      this.phoneNumber,
      this.qualification,
      this.dob,
      this.bloodType,
      this.country,
      this.state,
      this.city,
      this.address,
      this.age});

  //data from server
  factory ProfileModel.fromMap(map) {
    return ProfileModel(
        uid: map['uid'],
        email: map['email'],
        username: map['username'],
        name: map['name'],
        phoneNumber: map['phoneNumber'],
        qualification: map['qualification'],
        dob: map['dob'],
        bloodType: map['bloodType'],
        country: map['country'],
        state: map['state'],
        city: map['city'],
        address: map['address'],
        age: map['age']);
  }

  //sending data to server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'username': username,
      'name': name,
      'phoneNumber': phoneNumber,
      'qualification': qualification,
      'dob': dob,
      'bloodType': bloodType,
      'country': country,
      'state': state,
      'city': city,
      'address': address,
      'age': age
    };
  }
}

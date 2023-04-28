class ContactModel {
  int? id;
  String name;
  String mobile;
  String? email;
  String? streetAddress;
  String? dob;
  String? image;
  String? gender;
  String? website;

  ContactModel(
      {this.id,
      required this.name,
      required this.mobile,
      this.email,
      this.streetAddress,
      this.dob,
      this.image,
      this.gender,
      this.website});
}

final List<ContactModel> contactListDB = [
  ContactModel(
    id: 1,
    name: 'Ibrahim',
    mobile: '01751800957',
    email: 'ibrhim@gmail.com',
    streetAddress: 'Demara, Dhaka',
    gender: 'Male',
    website: 'www.flutter.dev',
    dob: '06/03/1998',
  ),
  ContactModel(
    id: 2,
    name: 'Hasan',
    mobile: '01892406060',
    email: 'hasan@gmail.com',
    streetAddress: 'Mirpur, Dhaka',
    gender: 'Male',
    website: 'www.flutter.dev',
    dob: '06/02/1999',
  )
];

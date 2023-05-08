const String tableContact = 'tbl_contact';
const String tableContactColId = 'id';
const String tableContactColName = 'name';
const String tableContactColNumber = 'number';
const String tableContactColEmail = 'email';
const String tableContactColAddress = 'address';
const String tableContactColCompany = 'company';
const String tableContactColDesignation = 'designation';
const String tableContactColWebsite = 'website';
const String tableContactColDob = 'bod';
const String tableContactColGender = 'gender';
const String tableContactColImage = 'image';
const String tableContactColFavorite = 'favorite';

class ContactModel {
  int? id;
  String name;
  String number;
  String? email;
  String? address;
  String? company;
  String? designation;
  String? website;
  String? dob;
  String? gender;
  String? image;
  bool favorite;

  ContactModel(
      {this.id,
      required this.name,
      required this.number,
      this.email,
      this.address,
      this.company,
      this.designation,
      this.website,
      this.dob,
      this.gender,
      this.image,
      this.favorite = false});
}

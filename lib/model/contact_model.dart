class ContactModel {
  int? id;
  String name;
  String number;
  String? email;
  String? address;
  String? company;
  String? designation;
  String? website;
  bool isFavorite;

  ContactModel({
    this.id,
    required this.name,
    required this.number,
    this.email,
    this.address,
    this.company,
    this.designation,
    this.website,
    this.isFavorite = false});
}

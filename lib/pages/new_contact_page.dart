import 'dart:io';

import 'package:address_book_practice/models/contact_model.dart';
import 'package:address_book_practice/providers/contact_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class NewContactPage extends StatefulWidget {
  static const String routeName = '/new_contact';

  const NewContactPage({Key? key}) : super(key: key);

  @override
  State<NewContactPage> createState() => _NewContactPageState();
}

class _NewContactPageState extends State<NewContactPage> {
  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final emailController = TextEditingController();
  final websiteController = TextEditingController();
  final addressController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? dob;
  String? imagePath;
  String genderGroupValue = 'Male';
  ImageSource source = ImageSource.camera;

  @override
  void dispose() {
    nameController.dispose();
    mobileController.dispose();
    emailController.dispose();
    websiteController.dispose();
    addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Contact'),
        actions: [
          IconButton(
              onPressed: () {
                _saveContact();
              },
              icon: const Icon(Icons.save))
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          physics: BouncingScrollPhysics(),
          padding: const EdgeInsets.all(10),
          children: [
            TextInputField(
              controller: nameController,
              labelText: 'Enter Name',
              validator: (value) {
                if (value!.isEmpty ?? true) {
                  return 'Enter your name';
                }
                return null;
              },
              icon: Icon(Icons.person),
            ),
            TextInputField(
              controller: mobileController,
              labelText: 'Enter Mobile',
              validator: (value) {
                if (value!.isEmpty ?? true) {
                  return 'Enter your mobile';
                }
                return null;
              },
              icon: const Icon(Icons.call),
            ),
            TextInputField(
              controller: emailController,
              labelText: 'Enter Email',
              validator: (value) {
                if (value!.isEmpty ?? true) {
                  return 'Enter your email';
                }
                return null;
              },
              icon: const Icon(Icons.email),
            ),
            TextInputField(
              controller: addressController,
              labelText: 'Enter Address',
              validator: (value) {
                if (value!.isEmpty ?? true) {
                  return 'Enter your address';
                }
                return null;
              },
              icon: const Icon(Icons.place),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: TextInputField(
                controller: websiteController,
                labelText: 'Enter Website',
                validator: (value) {
                  if (value!.isEmpty ?? true) {
                    return 'Enter your website';
                  }
                  return null;
                },
                icon: const Icon(Icons.web),
              ),
            ),
            Card(
              elevation: 8,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Select Gender'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Radio(
                          value: 'Male',
                          groupValue: genderGroupValue,
                          onChanged: (value) {
                            setState(() {
                              genderGroupValue = value!;
                            });
                          }),
                      const Text('Male'),
                      Radio(
                          value: 'Female',
                          groupValue: genderGroupValue,
                          onChanged: (value) {
                            setState(() {
                              genderGroupValue = value!;
                            });
                          }),
                      const Text('Female'),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: _showDatePickerDialog,
                      child: const Text('Select Date of Birth')),
                  Chip(
                    label: Text(dob == null ? 'No date chosen' : dob!),
                  )
                ],
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Card(
                  elevation: 10,
                  child: imagePath == null
                      ? Image.asset(
                          'images/person.jpg',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        )
                      : Image.file(
                          File(imagePath!),
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton.icon(
                        onPressed: () {
                          source = ImageSource.camera;
                          _getImage();
                        },
                        icon: const Icon(Icons.camera),
                        label: const Text('Capture')),
                    TextButton.icon(
                        onPressed: () {
                          source = ImageSource.gallery;
                          _getImage();
                        },
                        icon: const Icon(Icons.photo),
                        label: const Text('Gallery'))
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void _showDatePickerDialog() async {
    DateTime? selectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1922),
        lastDate: DateTime.now());
    if (selectedDate != null) {
      setState(() {
        dob = DateFormat('dd/MM/yyyy').format(selectedDate);
      });
    }
  }

  void _getImage() async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        imagePath = pickedFile.path;
      });
    }
  }

  void _saveContact() {
    final contact = ContactModel(
      name: nameController.text,
      mobile: mobileController.text,
      email: emailController.text,
      streetAddress: addressController.text,
      website: websiteController.text,
      dob: dob,
      image: imagePath,
      gender: genderGroupValue,
    );
    Provider.of<ContactProvider>(context, listen: false).addContact(contact);
    //Navigator.pop(context);
    if (_formKey.currentState!.validate()) {
      Navigator.pop(context);
    }
  }
}

class TextInputField extends StatelessWidget {
  TextInputField(
      {required this.controller,
      required this.labelText,
      this.icon,
      this.validator});

  final TextEditingController controller;
  final String labelText;
  final Icon? icon;
  final Function? validator;

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        validator: (value) {
          if (validator != null) {
            return validator!(value);
          }
          return null;
        },
        controller: controller,
        decoration: InputDecoration(
            prefixIcon: icon,
            border: const OutlineInputBorder(),
            labelText: labelText,
            labelStyle: const TextStyle(color: Colors.grey),
            focusedBorder: const OutlineInputBorder()),
      ),
    );
  }
}

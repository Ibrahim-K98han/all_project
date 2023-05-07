import 'package:address_book_practice/model/contact_model.dart';
import 'package:flutter/material.dart';

import '../custom_widgets/text_input_field.dart';

class NewContactPage extends StatefulWidget {
  static const String routeName = '/new_contact';

  @override
  State<NewContactPage> createState() => _NewContactPageState();
}

class _NewContactPageState extends State<NewContactPage> {
  final nameController = TextEditingController();
  final numberController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final companyController = TextEditingController();
  final designationController = TextEditingController();
  final websiteController = TextEditingController();
  final form_key = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    numberController.dispose();
    emailController.dispose();
    addressController.dispose();
    companyController.dispose();
    designationController.dispose();
    websiteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Contact'),
        actions: [
          IconButton(
            onPressed: _saveContact,
            icon: Icon(Icons.save),
          )
        ],
      ),
      body: Form(
        key: form_key,
        child: ListView(
          children: [
            textInputField(
                nameController: nameController,
                labelText: 'Name',
                icon: Icon(Icons.person),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Enter your Name';
                  }
                  return null;
                }),
            textInputField(
                nameController: numberController,
                labelText: 'Number',
                icon: Icon(Icons.call),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Enter your Number';
                  }
                  return null;
                }),
            textInputField(
                nameController: emailController,
                labelText: 'Email',
                icon: Icon(Icons.email),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Enter your Email';
                  }
                  return null;
                }),
            textInputField(
                nameController: addressController,
                labelText: 'Address',
                icon: Icon(Icons.location_on),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Enter your Address';
                  }
                  return null;
                }),
            textInputField(
                nameController: companyController,
                labelText: 'Company',
                icon: Icon(Icons.home),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Enter your Company Name';
                  }
                  return null;
                }),
            textInputField(
                nameController: designationController,
                labelText: 'Designation',
                icon: Icon(Icons.home_repair_service),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Enter your Designation';
                  }
                  return null;
                }),
            textInputField(
                nameController: websiteController,
                labelText: 'Website',
                icon: Icon(Icons.web),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Enter your Website';
                  }
                  return null;
                }),
          ],
        ),
      ),
    );
  }

  void _saveContact() {
    if (form_key.currentState!.validate()) {
      final contact = ContactModel(
          name: nameController.text,
          number: numberController.text,
          email: emailController.text,
          address: addressController.text,
          company: companyController.text,
          designation: designationController.text,
          website: websiteController.text
      );
    }
  }
}

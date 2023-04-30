import 'package:flutter/material.dart';

class ContactDetailsPage extends StatefulWidget {
  static const String routeName = '/contact_details';

  @override
  State<ContactDetailsPage> createState() => _ContactDetailsPageState();
}

class _ContactDetailsPageState extends State<ContactDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text('Contact Details Page'),),
    );
  }
}

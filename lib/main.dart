import 'package:flutter/material.dart';

void main() {
  runApp(ContactApps());
}

class ContactApps extends StatefulWidget {
  const ContactApps({Key? key}) : super(key: key);

  @override
  State<ContactApps> createState() => _ContactAppsState();
}

class _ContactAppsState extends State<ContactApps> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
    );
  }
}

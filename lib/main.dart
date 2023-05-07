import 'package:address_book_practice/pages/contact_details_page.dart';
import 'package:address_book_practice/pages/contact_list_page.dart';
import 'package:address_book_practice/pages/new_contact_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ContactApp());
}

class ContactApp extends StatelessWidget {
  const ContactApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contact Apps',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: ContactListPage.routeName,
      routes: {
        ContactListPage.routeName: (context) => ContactListPage(),
        NewContactPage.routeName: (context) => NewContactPage(),
        ContactDetailsPage.routeName: (context) => ContactDetailsPage(),
      },
    );
  }
}

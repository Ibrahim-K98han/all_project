import 'package:address_book_practice/pages/contact_details_page.dart';
import 'package:address_book_practice/pages/contact_list_page.dart';
import 'package:address_book_practice/pages/new_contact_page.dart';
import 'package:address_book_practice/providers/contact_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => ContactProvider()..getAllContacts())
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: ContactListPage.routeName,
      routes: {
        ContactListPage.routeName: (context) => const ContactListPage(),
        NewContactPage.routeName: (context) => const NewContactPage(),
        ContactDetailsPage.routeName: (context) => const ContactDetailsPage(),
      },
    );
  }
}

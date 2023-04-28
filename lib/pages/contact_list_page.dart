import 'dart:io';

import 'package:address_book_practice/models/contact_model.dart';
import 'package:address_book_practice/pages/contact_details_page.dart';
import 'package:address_book_practice/pages/new_contact_page.dart';
import 'package:address_book_practice/providers/contact_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactListPage extends StatefulWidget {
  static const String routeName = '/';

  const ContactListPage({Key? key}) : super(key: key);

  @override
  State<ContactListPage> createState() => _ContactListPageState();
}

class _ContactListPageState extends State<ContactListPage> {
  late ContactModel contact;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact List'),
      ),
      body: Consumer<ContactProvider>(builder: (context, provider, child) {
        return ListView.builder(
          itemCount: provider.contactList.length,
          itemBuilder: (context, index) {
            final contact = provider.contactList[index];
            return Dismissible(
              key: UniqueKey(),
              child: Card(
                child: ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, ContactDetailsPage.routeName,
                        arguments: contact);
                  },
                  leading: contact.image == null
                      ? Padding(
                          padding:
                              const EdgeInsets.only(left: 8, top: 5, bottom: 5),
                          child: Image.asset(
                            'images/person.jpg',
                          ),
                        )
                      : Padding(
                          padding:
                              const EdgeInsets.only(left: 8, top: 5, bottom: 5),
                          child: Image.file(File(contact.image.toString())),
                        ),
                  title: Text(contact.name),
                ),
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, NewContactPage.routeName).then((_) {
            setState(() {});
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

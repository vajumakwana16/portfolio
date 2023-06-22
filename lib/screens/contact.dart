import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:portfolio/utils/utils.dart';

import '../widgets/social_icons.dart';

class Contact extends StatefulWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: Get.height * 0.9,
        color: Colors.black,
        alignment: Alignment.center,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ContactForm(),
            SocialIcons(),
          ],
        ));
  }
}

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Utils.buildPageTitle(context, "Contact"),
          buildField(icon: Icons.person, hint: 'Name'),
          buildField(icon: Icons.email, hint: 'Email'),
          buildField(icon: Icons.message, hint: 'Message'),
          ElevatedButton(
              onPressed: () => Utils.sendEmail(), child: Text("Submit"))
        ],
      )),
    );
  }

  buildField({required IconData icon, required String hint}) => SizedBox(
      width: Get.width * 0.8,
      child: Padding(
        padding: EdgeInsets.all(Get.height * 0.02),
        child: TextFormField(
          maxLines: icon == Icons.message ? 5 : 1,
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white10,
              icon: Icon(icon),
              iconColor: primaryColor,
              hintText: hint,
              hintStyle: const TextStyle(color: Colors.grey)),
        ),
      ));
}

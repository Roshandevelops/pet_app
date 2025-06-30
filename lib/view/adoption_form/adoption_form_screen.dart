import 'package:flutter/material.dart';
import 'package:pet_app/widget/constants.dart';

class AdoptionFormScreen extends StatefulWidget {
  const AdoptionFormScreen({super.key});

  @override
  State<AdoptionFormScreen> createState() => _AdoptionFormScreenState();
}

class _AdoptionFormScreenState extends State<AdoptionFormScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController noOfPetsController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Add screen"),
          centerTitle: true,
          backgroundColor: kblue),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: "Name",
                border: OutlineInputBorder(),
              ),
            ),
            kheight,
            TextFormField(
              controller: ageController,
              decoration: const InputDecoration(
                  hintText: "Age", border: OutlineInputBorder()),
            ),
            kheight,
            TextFormField(
              controller: genderController,
              decoration: const InputDecoration(
                  hintText: "Gender", border: OutlineInputBorder()),
            ),
            kheight,
            TextFormField(
              controller: noOfPetsController,
              decoration: const InputDecoration(
                  hintText: "Number of pets", border: OutlineInputBorder()),
            ),
            kheight,
            ElevatedButton(
              onPressed: () {},
              child: const Text("Save"),
            )
          ],
        ),
      )),
    );
  }
}

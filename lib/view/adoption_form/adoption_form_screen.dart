import 'package:flutter/material.dart';
import 'package:pet_app/controller/user_provider.dart';
import 'package:pet_app/model/adoption_model/adoption_model.dart';
import 'package:pet_app/model/pet_model.dart';
import 'package:pet_app/widget/constants.dart';
import 'package:provider/provider.dart';

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
              onPressed: () async {
                await addUserData();
              },
              child: const Text("Save"),
            ),
            SizedBox(height: 20),
            Expanded(
                child: Consumer<UserProvider>(
              builder: (context, userConsumer, child) => userConsumer
                      .petAdoptionList.isNotEmpty
                  ? ListView.builder(
                      itemCount: userConsumer.petAdoptionList.length,
                      itemBuilder: (context, index) {
                        final pet = userConsumer.petAdoptionList[index];
                        return Card(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              pet.name ?? 'No name',
                            ),
                            kheight,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Age: ${pet.age}'),
                                Text('Gender: ${pet.gender}'),
                                Text('No.of Pets: ${pet.noOfPets}'),
                              ],
                            )
                          ],
                        ));
                      },
                    )
                  : Text('No pets adopted'),
            ))
          ],
        ),
      )),
    );
  }

  Future<void> addUserData() async {
    final name = nameController.text;
    final age = ageController.text;
    final gender = genderController.text;
    final noOfPets = noOfPetsController.text;

    if (name.isEmpty) {
      return;
    }

    final ageParsed = int.tryParse(age);
    if (ageParsed == null) {
      return;
    }
    if (gender.isEmpty) {
      return;
    }
    if (noOfPets.isEmpty) {
      return;
    }

    final model = AdoptionModel(
      name: name,
      age: ageParsed,
      gender: gender,
      noOfPets: noOfPets,
    );

    await Provider.of<UserProvider>(context, listen: false)
        .addAdoptionData(model);
  }
}

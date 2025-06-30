import 'package:flutter/material.dart';
import 'package:pet_app/controller/user_provider.dart';
import 'package:pet_app/view/adoption_form/adoption_form_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        await Provider.of<UserProvider>(context, listen: false).getData();
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(builder: (context, userConsumer, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Home screen"),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: userConsumer.isFetchPetsLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : userConsumer.petList.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SafeArea(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                  "Filtered by friendly",
                                  style: TextStyle(fontSize: 20),
                                ),
                                Flexible(
                                  child: Checkbox(
                                    value: userConsumer.isFilterApplied,
                                    onChanged: (value) async {
                                      Provider.of<UserProvider>(context,
                                              listen: false)
                                          .filterPets();
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: userConsumer.petList.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  leading: CircleAvatar(
                                      backgroundImage: NetworkImage(userConsumer
                                              .petList[index].petImage ??
                                          "https://st4.depositphotos.com/14953852/24787/v/1600/depositphotos_247872612-stock-illustration-no-image-available-icon-vector.jpg ")),
                                  title: Text(
                                      userConsumer.petList[index].userName ??
                                          "Unknown"),
                                  subtitle: Text(
                                      userConsumer.petList[index].petName ??
                                          "Unknown"),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : Center(
                    child: Text(
                      "Something went wrong",
                    ),
                  ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) {
                  return AdoptionFormScreen();
                },
              ),
            );
          },
          child: Text("Add "),
        ),
      );
    });
  }
}

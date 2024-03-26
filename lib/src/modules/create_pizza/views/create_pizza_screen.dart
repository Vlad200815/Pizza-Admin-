import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pizza_admin_app/src/modules/create_pizza/blocs/bloc/upload_picture_bloc.dart';
import 'package:pizza_admin_app/src/modules/create_pizza/components/macro_widget.dart';
import 'package:pizza_admin_app/src/modules/create_pizza/components/mybutton_widget.dart';
import 'package:pizza_admin_app/src/modules/create_pizza/components/mytextfield_widget.dart';
import 'package:pizza_repository/pizza_repository.dart';

class CreatePizzaScreen extends StatefulWidget {
  const CreatePizzaScreen({super.key});

  @override
  State<CreatePizzaScreen> createState() => _CreatePizzaScreenState();
}

class _CreatePizzaScreenState extends State<CreatePizzaScreen> {
  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();
  final discountController = TextEditingController();

  final caloriesController = TextEditingController();
  final fatController = TextEditingController();
  final carbsController = TextEditingController();
  final proteinController = TextEditingController();

  late Pizza pizza;

  @override
  void initState() {
    pizza = Pizza.empty;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () async {
                  try {
                    final ImagePicker picker = ImagePicker();
                    final XFile? image = await picker.pickImage(
                      source: ImageSource.gallery,
                      maxHeight: 1000,
                      maxWidth: 1000,
                    );
                    if (image != null && context.mounted) {
                      context
                          .read<UploadPictureBloc>()
                          .add(UploadPicture(await image.readAsBytes()));
                    }
                  } catch (e) {
                    print(e.toString());
                  }
                },
                child: Ink(
                  width: 400,
                  height: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          CupertinoIcons.photo,
                          color: Colors.grey.shade400,
                          size: 100,
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Add a Picture here...",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            // SizedBox(
            //   width: 400,
            //   child: Form(
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SizedBox(
                    width: 400,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CreateTextField(
                          width: 200,
                          hint: "Name",
                          controller: nameController,
                          horizontal: 20,
                          vertical: 5,
                          radius: 20,
                          keyboardType: TextInputType.name,
                        ),
                        CreateTextField(
                          width: 200,
                          hint: "Description",
                          controller: descriptionController,
                          horizontal: 20,
                          vertical: 5,
                          radius: 20,
                          keyboardType: TextInputType.name,
                        ),
                        SizedBox(
                          width: 400,
                          child: Row(
                            children: [
                              Expanded(
                                child: CreateTextField(
                                  width: 200,
                                  hint: "Price",
                                  controller: priceController,
                                  horizontal: 20,
                                  vertical: 5,
                                  radius: 20,
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: CreateTextField(
                                  suffixIcon: Icon(
                                    CupertinoIcons.percent,
                                    color: Colors.grey[600],
                                  ),
                                  hint: "Discount",
                                  controller: discountController,
                                  horizontal: 20,
                                  vertical: 5,
                                  radius: 20,
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            const Text(
                              "Is Veg :",
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                            Checkbox(
                              value: pizza.isVeg,
                              onChanged: (value) {
                                setState(() {
                                  pizza.isVeg = value!;
                                });
                              },
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Text(
                              "Is Spicy :",
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                            // Checkbox(
                            //   value: false,
                            //   onChanged: (value) {},
                            // ),
                            const SizedBox(width: 10),
                            InkWell(
                              borderRadius: BorderRadius.circular(100),
                              onTap: () {
                                setState(() {
                                  pizza.spicy = 1;
                                });
                              },
                              child: Ink(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: pizza.spicy == 1
                                      ? Border.all(width: 2)
                                      : null,
                                  color: Colors.green,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              borderRadius: BorderRadius.circular(100),
                              onTap: () {
                                setState(() {
                                  pizza.spicy = 2;
                                });
                              },
                              child: Ink(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: pizza.spicy == 2
                                      ? Border.all(width: 2)
                                      : null,
                                  color: Colors.orange,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              borderRadius: BorderRadius.circular(100),
                              onTap: () {
                                setState(() {
                                  pizza.spicy = 3;
                                });
                              },
                              child: Ink(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: pizza.spicy == 3
                                      ? Border.all(width: 2)
                                      : null,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 0,
                            vertical: 5,
                          ),
                          child: Text(
                            "Macros : ",
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 0,
                            vertical: 5,
                          ),
                          child: Row(
                            children: [
                              MyMacroWidget(
                                controller: caloriesController,
                                title: "Calories",
                                value: 12,
                                icon: FontAwesomeIcons.fire,
                              ),
                              const SizedBox(width: 5),
                              MyMacroWidget(
                                controller: proteinController,
                                title: "Protein",
                                value: 12,
                                icon: FontAwesomeIcons.dumbbell,
                              ),
                              const SizedBox(width: 5),
                              MyMacroWidget(
                                controller: fatController,
                                title: "Fat",
                                value: 12,
                                icon: FontAwesomeIcons.oilWell,
                              ),
                              const SizedBox(width: 5),
                              MyMacroWidget(
                                controller: carbsController,
                                title: "Carbs",
                                value: 12,
                                icon: FontAwesomeIcons.breadSlice,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: CreateButton(
                text: "Create",
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    setState(() {
                      pizza.name = nameController.text;
                      pizza.description = descriptionController.text;
                      pizza.discount = int.parse(discountController.text);
                      pizza.price = int.parse(priceController.text);
                      pizza.macros.calories =
                          int.parse(caloriesController.text);
                      pizza.macros.carbs = int.parse(carbsController.text);
                      pizza.macros.fat = int.parse(fatController.text);
                      pizza.macros.proteins = int.parse(proteinController.text);
                    });
                    print(pizza);
                  }
                },
                color: Colors.blue,
                radius: 20,
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}

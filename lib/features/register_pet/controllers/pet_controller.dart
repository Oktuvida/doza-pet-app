import 'package:doza_pet/constants/constants.dart';
import 'package:doza_pet/core/utils.dart';
import 'package:doza_pet/models/models.dart';
import 'package:doza_pet/repositories/repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final petControllerProvider = StateNotifierProvider<PetController, bool>((ref) {
  return PetController();
});

class PetController extends StateNotifier<bool> {
  final _petRepository = PetRepository();

  PetController() : super(false);

  void addPetInformation(
      {required int age,
      required String foodBrand,
      required String name,
      required String race,
      required String userId,
      required double weight,
      required BuildContext context}) async {
    state = true;
    final pet = Pet(
      age: age,
      foodBrand: foodBrand,
      name: name,
      race: race,
      userId: userId,
      weight: weight,
    );
    final res = await _petRepository.insert(data: pet);
    res.fold((l) => showSnackBar(context, l.message), (r) {
      Navigator.pushReplacementNamed(context, RouteConstants.root);
    });
  }
}

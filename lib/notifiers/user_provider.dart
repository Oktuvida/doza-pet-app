import 'package:doza_pet/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userProvider = ChangeNotifierProvider((res) => UserListener());

class UserListener extends ChangeNotifier {
  String? _email;
  String? get email => _email;

  final List<Pet> _pets = [];
  List<Pet> get pets => _pets;

  final List<Portion> _portions = [];
  List<Portion> get portions => _portions;

  void set(String? email, List<Pet> pets, List<Portion> portions) {
    _email = email;

    _pets.clear();
    _pets.addAll(pets);

    _portions.clear;
    _portions.addAll(portions);

    notifyListeners();
  }

  void addPortion(Portion portion) {
    _portions.add(portion);
    notifyListeners();
  }

  void removePortion(BigInt id) {
    _portions.remove(_portions.firstWhere((element) => element.id == id));
    notifyListeners();
  }
}

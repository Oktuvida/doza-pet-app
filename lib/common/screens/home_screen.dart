import 'package:doza_pet/features/portions/screens/portion_screen.dart';
import 'package:doza_pet/features/register_pet/screens/pet_information_screen.dart';
import 'package:doza_pet/notifiers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final pets = ref.watch(userProvider).pets;

    return Scaffold(
        body: pets.isNotEmpty
            ? const PortionScreen()
            : const PetInformationScreen());
  }
}

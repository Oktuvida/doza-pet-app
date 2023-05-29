import 'package:doza_pet/core/utils.dart';
import 'package:doza_pet/models/portion.dart';
import 'package:doza_pet/notifiers/user_provider.dart';
import 'package:doza_pet/repositories/repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

final portionControllerProvider =
    StateNotifierProvider<PortionController, bool>((ref) {
  return PortionController(ref.watch(userProvider.notifier));
});

class PortionController extends StateNotifier<bool> {
  final _portionRepository = PortionRepository();
  final UserListener _userProvider;

  PortionController(this._userProvider) : super(false);

  void addPortion(
      {required BigInt deviceId,
      required double foodToDispense,
      required int dispensingTime,
      required BuildContext context}) async {
    state = !state;
    final portion = Portion(deviceId, foodToDispense, dispensingTime);
    final res = await _portionRepository.insert(data: portion);

    res.fold((l) {
      showSnackBar(context, l.message);
    }, (r) {
      final localizations = AppLocalizations.of(context)!;
      _userProvider.addPortion(r[0]);
      showSnackBar(context, localizations.portionAdded);
    });
  }

  void deletePortion(
      {required BigInt id, required BuildContext context}) async {
    state = !state;

    final res = await _portionRepository.delete(
        column: "id_porcion", value: id.toString());

    res.fold((l) {
      showSnackBar(context, l.message);
    }, (r) {
      final localizations = AppLocalizations.of(context)!;
      _userProvider.removePortion(id);
      showSnackBar(context, localizations.portionRemoved);
    });
  }
}

import 'package:doza_pet/common/utils/utils.dart';
import 'package:flutter/material.dart';

class PortionViewer extends StatelessWidget {
  final BigInt portionId;
  final String foodToDispense;
  final int dispensingTime;
  final void Function(BigInt portionId) onTap;

  const PortionViewer(
      {super.key,
      required this.foodToDispense,
      required this.dispensingTime,
      required this.portionId,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ActionChip(
                label: Text(foodToDispense),
                avatar: const Icon(Icons.monitor_weight)),
            const SizedBox(
              width: 10,
            ),
            ActionChip(
              label: Text(minutesToTime(dispensingTime)),
              avatar: const Icon(Icons.timer),
            ),
          ],
        ),
        Container(
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: () {
              onTap(portionId);
            },
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: theme.colorScheme.primary),
              child: Icon(
                Icons.delete,
                color: theme.colorScheme.background,
              ),
            ),
          ),
        )
      ],
    );
  }
}

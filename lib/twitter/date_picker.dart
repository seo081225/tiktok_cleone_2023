import 'package:flutter/cupertino.dart';

class CuDatePicker extends StatelessWidget {
  const CuDatePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxWidth: 300,
      ),
      child: CupertinoDatePicker(
        initialDateTime:
            DateTime.now().subtract(const Duration(days: 365 * 20)),
        maximumDate: DateTime.now(),
        mode: CupertinoDatePickerMode.date,
        onDateTimeChanged: (DateTime value) {},
      ),
    );
  }
}

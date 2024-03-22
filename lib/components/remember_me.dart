import 'package:flutter/material.dart';

class RememberMeCheckbox extends StatefulWidget {
  final ValueChanged<bool> onChanged;
  final bool initialValue;
  const RememberMeCheckbox(
      {super.key, required this.onChanged, this.initialValue = false});

  @override
  State<RememberMeCheckbox> createState() => _RememberMeCheckboxState();
}

class _RememberMeCheckboxState extends State<RememberMeCheckbox> {
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    isChecked = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      fillColor:
          MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return Colors.orange.withOpacity(.32);
        } else if (states.contains(MaterialState.selected)) {
          return Colors.green;
        }
        return Color.fromARGB(123, 33, 149, 243);
      }),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value ?? false;
        });

        // Call the callback
        widget.onChanged(isChecked);
      },
    );
  }
}

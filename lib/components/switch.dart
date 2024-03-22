import 'package:flutter/material.dart';

class SwitchComponent extends StatefulWidget {
  final Icon iconOn;
  final Icon iconOff;
  final Function actionOn;
  final Function actionOff;

  const SwitchComponent({
    Key? key,
    required this.iconOn,
    required this.iconOff,
    required this.actionOn,
    required this.actionOff,
  }) : super(key: key);

  @override
  State<SwitchComponent> createState() => _SwitchComponentState();
}

class _SwitchComponentState extends State<SwitchComponent> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: isSwitched,
      onChanged: (value) {
        setState(() {
          isSwitched = value;
          if (value) {
            widget.actionOn();
          } else {
            widget.actionOff();
          }
        });
      },
      thumbColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.selected)) {
            return Colors.green;
          }
          return Colors.red;
        },
      ),
      thumbIcon: MaterialStateProperty.resolveWith<Icon>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.selected)) {
            return widget.iconOn;
          }
          return widget.iconOff;
        },
      ),
    );
  }
}

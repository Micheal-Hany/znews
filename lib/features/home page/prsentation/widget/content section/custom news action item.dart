// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomNewsActionItem extends StatefulWidget {
  CustomNewsActionItem({
    Key? key,
    this.onPressed,
    required this.iconDataTrue,
    required this.iconDataFalse,
  }) : super(key: key);

  final IconData? iconDataTrue;
  final IconData? iconDataFalse;
  void Function()? onPressed;

  @override
  State<CustomNewsActionItem> createState() => _CustomNewsActionState();
}

class _CustomNewsActionState extends State<CustomNewsActionItem> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(200),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(200),
        onTap: () async {
          setState(() {
            isSelected = !isSelected;
          });
          widget.onPressed!.call();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          child: Icon(
            isSelected ? widget.iconDataFalse : widget.iconDataTrue,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

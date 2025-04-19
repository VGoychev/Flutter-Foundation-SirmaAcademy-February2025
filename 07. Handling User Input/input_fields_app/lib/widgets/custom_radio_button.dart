import 'package:flutter/material.dart';

class CustomRadioButton extends StatelessWidget {
  final String? selected;
  final List<String> options;
  final ValueChanged<String?> onChanged;
  final String? label;

  const CustomRadioButton(
      {super.key,
      required this.options,
      required this.selected,
      required this.onChanged,
      this.label});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) Text(label!),
        Row(
          children: options.map((option) {
            return Expanded(
                child: RadioListTile<String>(
              title: Text(
                option,
                maxLines: 1,
              ),
              contentPadding: EdgeInsets.zero,
              value: option,
              groupValue: selected,
              onChanged: onChanged,
            ));
          }).toList(),
        )
      ],
    );
  }
}

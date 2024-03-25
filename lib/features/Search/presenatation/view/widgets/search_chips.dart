import 'package:flutter/material.dart';

import '../../../../../core/constants/constants.dart';

class SearchChips extends StatelessWidget {
  const SearchChips({
    super.key,
    required this.chipLabels,
    required this.icon,
  });

  final List<String> chipLabels;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Wrap(
        runSpacing: 8.0,
        spacing: 8.0,
        children: chipLabels.map((label) {
          return ChipWithIcon(
            label: label,
            icon: icon,
            onTap: () {},
          );
        }).toList(),
      ),
    );
  }
}

class ChipWithIcon extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  const ChipWithIcon({
    super.key,
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: IntrinsicWidth(
        child: Chip(
          backgroundColor: wajbah_white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(
              color: wajbah_gray,
              width: 1.0,
            ),
          ),
          label: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: wajbah_primary,
                size: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Text(label),
              ),
            ],
          ),
          labelStyle: const TextStyle(color: wajbah_gray),
          elevation: 2,
          padding: const EdgeInsets.symmetric(vertical: 2),
        ),
      ),
    );
  }
}

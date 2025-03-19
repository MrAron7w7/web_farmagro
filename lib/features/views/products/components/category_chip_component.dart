import 'package:flutter/material.dart';

class CategoryChipComponent extends StatelessWidget {
  final String label;
  final bool isSelected;
  const CategoryChipComponent({
    super.key,
    required this.label,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      selected: isSelected,
      label: Text(label),
      onSelected: (bool selected) {},
      backgroundColor: Colors.grey[200],
      selectedColor: const Color(0xFF046E32).withOpacity(0.3),
      labelStyle: TextStyle(
        color: isSelected ? const Color(0xFF046E32) : Colors.black87,
        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }
}

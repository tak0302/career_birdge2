// filter_dialog.dart
import 'package:flutter/material.dart';

class FilterDialog extends StatefulWidget {
  const FilterDialog({super.key});

  @override
  State<FilterDialog> createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  String selectedField = '전체';
  RangeValues experienceRange = const RangeValues(0, 20);
  String selectedLocation = '전체';
  String userType = '전체';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('검색 필터'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DropdownButtonFormField<String>(
              value: selectedField,
              decoration: const InputDecoration(labelText: '직무 분야'),
              items: ['전체', 'IT/개발', '경영/기획', '마케팅', '디자인']
                  .map((field) => DropdownMenuItem(
                value: field,
                child: Text(field),
              ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedField = value!;
                });
              },
            ),
            const SizedBox(height: 16),
            const Text('경력 년수'),
            RangeSlider(
              values: experienceRange,
              min: 0,
              max: 20,
              divisions: 20,
              labels: RangeLabels(
                '${experienceRange.start.round()}년',
                '${experienceRange.end.round()}년',
              ),
              onChanged: (values) {
                setState(() {
                  experienceRange = values;
                });
              },
            ),
            DropdownButtonFormField<String>(
              value: userType,
              decoration: const InputDecoration(labelText: '구분'),
              items: ['전체', '멘토', '멘티']
                  .map((type) => DropdownMenuItem(
                value: type,
                child: Text(type),
              ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  userType = value!;
                });
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('취소'),
        ),
        FilledButton(
          onPressed: () {
            // TODO: 필터 적용 로직 구현
            Navigator.pop(context);
          },
          child: const Text('적용'),
        ),
      ],
    );
  }
}

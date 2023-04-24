import 'package:alfie/models/theme_color.dart';
import 'package:alfie/utils/string.dart';
import 'package:flutter/material.dart';

class ColorPicker extends StatefulWidget {
  final bool includeWhiteColor;
  final Color? selectedColor;
  final Function(Color) onColorChanged;

  const ColorPicker({
    Key? key,
    this.includeWhiteColor = false,
    this.selectedColor,
    required this.onColorChanged,
  }) : super(key: key);

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  Color _selectedColor = Colors.white;

  @override
  void initState() {
    super.initState();

    if (widget.includeWhiteColor) {
      // check that the selected color passed is in the list of options
      if (widget.selectedColor != null && _colorOptions.map((e) => e.value).contains(widget.selectedColor)) {
        _selectedColor = widget.selectedColor!;
      } else {
        _selectedColor = Colors.white;
      }
    } else {
      // check that the selected color passed is in the list of options
      if (widget.selectedColor != null &&
          _colorOptionsWithoutWhite.map((e) => e.value).contains(widget.selectedColor)) {
        _selectedColor = widget.selectedColor!;
      } else {
        _selectedColor = _colorOptions.first.value!;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        value: _selectedColor,
        items: widget.includeWhiteColor ? _colorOptions : _colorOptionsWithoutWhite,
        onChanged: (newColor) {
          setState(() {
            _selectedColor = newColor!;
          });
          widget.onColorChanged(newColor!);
        });
  }
}

var _colorOptions = ThemeColor.values
    .map((e) => DropdownMenuItem(
        value: e.toColor,
        child: Row(children: [
          Container(
            margin: const EdgeInsets.only(right: 7.5),
            decoration: BoxDecoration(
              color: e.toColor,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black),
            ),
            child: Icon(Icons.circle, color: e.toColor),
          ),
          Text(e.name.toTitleCase),
        ])))
    .toList();

var _colorOptionsWithoutWhite = (ThemeColor.values..remove(ThemeColor.white))
    .map((e) => DropdownMenuItem(
        value: e.toColor,
        child: Row(children: [
          Container(
            margin: const EdgeInsets.only(right: 7.5),
            decoration: BoxDecoration(
              color: e.toColor,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black),
            ),
            child: Icon(Icons.circle, color: e.toColor),
          ),
          Text(e.name.toTitleCase),
        ])))
    .toList();

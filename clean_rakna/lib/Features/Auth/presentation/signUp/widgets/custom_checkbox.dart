import 'package:flutter/material.dart';
import '../../../../../core/theme/colors_theme.dart';

class CustomCheckbox extends StatefulWidget {
  final bool isChecked;
  final ValueChanged<bool> onChecked;

  const CustomCheckbox({
    super.key,
    required this.isChecked,
    required this.onChecked,
  });

  @override
  CustomCheckboxState createState() => CustomCheckboxState();
}

class CustomCheckboxState extends State<CustomCheckbox> {
  late bool _isChecked;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.isChecked;
  }

  void _toggleCheckbox() {
    setState(() {
      _isChecked = !_isChecked;
    });
    widget.onChecked(_isChecked);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleCheckbox,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 24.0,
        height: 24.0,
        decoration: BoxDecoration(
          color: _isChecked ? Colors.green : Colors.white,
          border: Border.all(
            color: _isChecked ? Colors.transparent : AppColors.greyScale50,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        alignment: Alignment.center,
        child: _isChecked
            ? const Padding(
                padding: EdgeInsets.all(4.0),
                child: Icon(
                  Icons.check,
                  size: 16.0,
                  color: Colors.white,
                ),
              )
            : null,
      ),
    );
  }
}

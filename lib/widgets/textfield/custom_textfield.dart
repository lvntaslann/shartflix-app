import 'package:flutter/material.dart';

import '../../themes/app_colors.dart';
import '../../utils/size.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.labelText,
    required this.icon,
    required this.controller,
    this.onChanged,
    this.isPassword = false,
  });

  final String labelText;
  final IconData icon;
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final bool isPassword;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenSize.getSize(context).width * 0.77,
      height: ScreenSize.getSize(context).height * 0.060,
      decoration: BoxDecoration(
        color: AppColors.authTextFieldBackgroundColor,
        border: Border.all(width: 1, color: AppColors.authTextFieldStrokeColor),
        borderRadius: BorderRadius.circular(18),
      ),
      child: TextField(
        style: TextStyle(color: AppColors.authButtonTextColor),
        controller: widget.controller,
        onChanged: widget.onChanged,
        obscureText: widget.isPassword ? _obscureText : false,
        decoration: InputDecoration(
          prefixIcon: Icon(widget.icon),
          labelText: widget.labelText,
          hintStyle: TextStyle(color: AppColors.authTextFieldHintStyle),
          labelStyle: TextStyle(color: AppColors.authTextFieldLabelColor),
          border: InputBorder.none,
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: AppColors.authTextFieldLabelColor,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                )
              : null,
        ),
      ),
    );
  }
}

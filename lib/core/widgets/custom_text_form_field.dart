import 'package:flutter/material.dart';
import 'package:sms_bring_flutter/core/colors/app_colors.dart';
import 'package:sms_bring_flutter/core/styles/styles.dart';

class CustomTextFormField extends StatefulWidget {
  final String title;
  final String hint;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool obscureText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final AutovalidateMode? autoValidateMode;

  const CustomTextFormField({
    super.key,
    required this.title,
    required this.hint,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    required this.controller,
    required this.validator,
    this.keyboardType,
    this.autoValidateMode,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isObscureText = false;
  @override
  void initState() {
    isObscureText = widget.obscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: Styles.titleSmall.copyWith(
            color: AppColors.darkGrey,
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        Container(
          padding: const EdgeInsets.only(bottom: 14),
          decoration: ShapeDecoration(
            gradient: const LinearGradient(
              colors: AppColors.textFieldLinearGradient,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.0, 0.4, 1],
              tileMode: TileMode.clamp,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: TextFormField(
            controller: widget.controller,
            obscureText: isObscureText,
            validator: widget.validator,
            autovalidateMode: widget.autoValidateMode,
            keyboardType: widget.keyboardType,
            decoration: InputDecoration(
              hintText: widget.hint,
              prefixIcon: Icon(
                widget.prefixIcon,
                color: AppColors.gray,
              ),
              suffixIcon: widget.suffixIcon != null
                  ? IconButton(
                      onPressed: () {
                        isObscureText = !isObscureText;
                        setState(() {});
                      },
                      icon: Icon(
                        isObscureText
                            ? Icons.visibility_off
                            : widget.suffixIcon,
                        color: AppColors.gray,
                      ),
                    )
                  : null,
              contentPadding: const EdgeInsets.symmetric(
                vertical: 15.0,
                horizontal: 10.0,
              ),
            ),
          ),
        )
      ],
    );
  }
}

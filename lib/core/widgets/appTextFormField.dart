import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/theming/colors.dart';
import 'package:flutter_advanced/core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFormField extends StatelessWidget
{

  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintTextStyle;
  final bool? isObSecureText;
  final Widget? suffixIcon;
  final String hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const AppTextFormField(
      {
        super.key,
        this.focusedBorder,
        this.contentPadding,
        this.enabledBorder,
        this.inputTextStyle,
        this.hintTextStyle,
        this.isObSecureText,
        this.suffixIcon,
        required this.hintText,
         this.controller,
         this.validator,
      });

  @override
  Widget build(BuildContext context)
  {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: contentPadding ?? EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 18.h
        ),

        enabledBorder: enabledBorder ?? const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.0),),
          borderSide: BorderSide(
            color: ColorsManager.lightergray,
            width: 1.3
          )
        ),
        focusedBorder: focusedBorder ?? const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.0),),
            borderSide: BorderSide(
                color: ColorsManager.mainColor,
                width: 1.3
            )
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        hintStyle: hintTextStyle ?? TextStyles.font14LightGrayRegular,
        hintText: hintText,
        suffixIcon: suffixIcon ?? const SizedBox(),
      ),
      obscureText: isObSecureText ?? false,
      style: TextStyles.font14DarkBlueMedium,
      validator: validator,


    );
  }
}

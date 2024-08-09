import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/helpers/spacing.dart';
import 'package:flutter_advanced/core/theming/colors.dart';
import 'package:flutter_advanced/core/theming/styles.dart';

class PasswordValidations extends StatelessWidget
{

  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasNumber;
  final bool hasSpecialCharacter;
  final bool hasMinimumLength;

  const PasswordValidations({Key? key, required this.hasLowerCase, required this.hasUpperCase, required this.hasNumber, required this.hasSpecialCharacter, required this.hasMinimumLength}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children:
      [
        buildValidationRow('At least 1 lowercase letter',hasLowerCase),
        verticalSpace(2.0),
        buildValidationRow('At least 1 uppercase letter',hasUpperCase),
        verticalSpace(2.0),
        buildValidationRow('At least 1 special character',hasSpecialCharacter),
        verticalSpace(2.0),
        buildValidationRow('At least 1 number',hasNumber),
        verticalSpace(2.0),
        buildValidationRow('At least 8 characters long',hasMinimumLength),
        verticalSpace(2.0),
      ],
    );
  }

  Widget buildValidationRow(String text, bool hasValidated)
  {
    return Row(
      children:
      [
         CircleAvatar(
          radius: 2.5,
          backgroundColor: hasValidated ? ColorsManager.gray : Colors.red,
        ),
        horizontalSpace(6.0),
        Text(text , style: TextStyles.font13DarkBlueRegular.copyWith(
          decoration: hasValidated ? TextDecoration.lineThrough : null,
          decorationColor: ColorsManager.gray,
          decorationThickness: 1.5,
          color: hasValidated ? ColorsManager.darkBlue : Colors.red
        ),)
      ],
    );

  }
}

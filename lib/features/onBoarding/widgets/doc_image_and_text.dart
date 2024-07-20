import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/theming/styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DocImageAndText extends StatelessWidget {
  const DocImageAndText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children:
      [
        SvgPicture.asset('assets/svgs/logo_low_opacity.svg'),
        Container(
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              colors:
              [
                Colors.white,
                Colors.white.withOpacity(0.0)
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops:const [0.14,0.4]
            )
          ),
          child: Image.asset('assets/images/noBoarding_doctor.png'),
        ),

        Positioned(
          bottom: 30.0,
            left: 0.0,
            right: 0.0,
            child: Text('Best Doctor Appointment App',
              maxLines: 2,

              style: TextStyles.font32BlueBold.copyWith(
                height: 1.4
              ),
              textAlign: TextAlign.center,
            ),
        )
      ],
    );
  }
}

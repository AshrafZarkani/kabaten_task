import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    required this.buttonTitle,
    this.onTap,
    this.height = 48,
    this.borderColor,
    this.width = 150,
    this.color,
    this.textColor,
    this.textSize,
    this.borderRadius,
  }) : super(key: key);

  final String buttonTitle;
  final VoidCallback? onTap;
  final double height;
  final double width;
  final Color? color;
  final Color? borderColor;
  final Color? textColor;
  final double? borderRadius;
  final double? textSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.all(
              Radius.circular(borderRadius ?? 15),
            ),
            border: Border.all(color: borderColor ?? Colors.white)),
        padding: const EdgeInsets.all(8),
        child: Center(
          child: FittedBox(
            child: Text(
              buttonTitle,
              style: TextStyle(
                color: textColor ?? Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: textSize != null ? 16 : 14,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

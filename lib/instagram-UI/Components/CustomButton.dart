import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.width,
    required this.height,
    this.color = Colors.white,
    this.icon,
    this.showIcon = false,
  });
  final String text;
  final double? width;
  final double height;
  final Color color;
  final IconData? icon;
  final bool showIcon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: () => {},
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(color),
          padding: const WidgetStatePropertyAll(EdgeInsets.zero),
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: showIcon && icon != null
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(text, maxLines: 1,style: TextStyle(color: Colors.black),),
                    const SizedBox(width: 4),
                    Icon(icon, size: 16),
                  ],
                )
              : Text(text, maxLines: 1,style: TextStyle(color: Colors.black)),
        ),
      ),
    );
  }
}

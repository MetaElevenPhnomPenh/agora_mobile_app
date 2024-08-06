import 'package:agora/export.dart';
import 'package:flutter/services.dart';

class TextFieldWidget extends StatelessWidget {
  final String? hintText;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final bool obscureText;

  const TextFieldWidget({
    super.key,
    this.hintText,
    this.keyboardType,
    this.prefixIcon,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTapOutside: (v) => app.focusNew(context),
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        hintText: hintText,
      ),
      keyboardType: keyboardType,
      obscureText: obscureText,
      inputFormatters: <TextInputFormatter>[
        if (keyboardType == TextInputType.number) FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
      ],
    );
  }
}

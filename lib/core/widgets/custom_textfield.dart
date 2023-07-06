import 'package:flutter/material.dart';

/// Custon Text Field
class CustomTextField extends StatefulWidget {
  /// Constructor
  CustomTextField({
    required this.hintText,
    required this.onChanged,
    super.key,
  });

  /// Hint text
  final String hintText;

  /// Function(String) callback
  final void Function(String) onChanged;

  /// TextEditing controller for [TextFormField]
  final TextEditingController controller = TextEditingController();

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: (value) {
        if (value!.isEmpty) {
          return 'please enter your ${widget.hintText}';
        }
        return null;
      },
      onChanged: (newValue) {
        widget.onChanged.call(newValue);
      },

      style: const TextStyle(
        fontSize: 15,
        color: Colors.black,
      ),
      textInputAction: TextInputAction.next,
      cursorColor: const Color.fromARGB(31, 74, 68, 68),
      cursorHeight: 20,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
        filled: true,
        fillColor: const Color.fromARGB(31, 74, 68, 68),
        hintText: widget.hintText,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class FieldBox extends StatelessWidget {
  const FieldBox({super.key});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final FocusNode focusNode = FocusNode();

    final inputDecoration = InputDecoration(
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide(
          width: 1.5,
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 10,
      ),
      hintText: 'Ask your question ...',
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      suffixIcon: IconButton(
        icon: const Icon(Icons.send),
        onPressed: () {
          print(textController.value.text);
          textController.clear();
        },
      ),
    );

    return TextFormField(
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textController,
      onFieldSubmitted: (value) {
        print(textController.value.text);
        textController.clear();
        focusNode.requestFocus();
      },
      cursorColor: Theme.of(context).colorScheme.inversePrimary,
      decoration: inputDecoration,
    );
  }
}

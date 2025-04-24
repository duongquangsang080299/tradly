import 'package:flutter/material.dart';
import 'package:tradly_app/presentations/widgets/text_field.dart';

class TAForm extends StatefulWidget {
  const TAForm({
    super.key,
    required this.textFields,
    required this.isValidated,
    this.spaceBetweenRow = 20,
    this.textInputAction,
  });

  final List<TATextField> textFields;
  final double spaceBetweenRow;
  final Function(bool value) isValidated;
  final TextInputAction? textInputAction;

  @override
  State<TAForm> createState() => _TAFormState();
}

class _TAFormState extends State<TAForm> {
  final formStateKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formStateKey,
      onChanged: () {
        (widget.textFields.every((element) =>
                (element.controller!.text.isNotEmpty ||
                    element.controller == null)))
            ? widget.isValidated(formStateKey.currentState!.validate())
            : widget.isValidated(false);
      },
      child: Column(
        children: [
          for (final (index, input) in widget.textFields.indexed) ...[
            if (index != widget.textFields.length - 1) ...[
              input.copyWith(
                textInputAction: TextInputAction.next,
                onEditingComplete: () => input.focusNode?.nextFocus(),
              ),
              SizedBox(
                height: widget.spaceBetweenRow,
              ),
            ] else
              input.copyWith(
                textInputAction: widget.textInputAction ?? TextInputAction.done,
                onEditingComplete: () {
                  final isValid =
                      formStateKey.currentState?.validate() ?? false;
                  widget.isValidated(isValid);
                },
              ),
          ],
        ],
      ),
    );
  }
}

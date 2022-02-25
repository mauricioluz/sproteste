import 'package:flutter/material.dart';
import 'package:sproteste/utils/decoration_utils.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final String labelText;
  String? hintText;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final bool readOnly;
  final Function(String) onSubmitted;

  CustomTextField(
      {Key? key,
      required this.controller,
      required this.focusNode,
      required this.labelText,
      this.hintText,
      this.inputType = TextInputType.text,
      this.inputAction = TextInputAction.done,
      this.readOnly = false,
      required this.onSubmitted})
      : super(key: key);

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextField>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: const EdgeInsets.only(top: 12),
      decoration: BoxDecoration(
        borderRadius: DecorationUtils.defaultBorderRadius,
        border: Border.all(color: Theme.of(context).primaryColor),
        color: Theme.of(context).primaryColor.withOpacity(.1),
      ),
      child: Center(
        child: TextField(
          focusNode: widget.focusNode,
          textAlignVertical: TextAlignVertical.center,
          enableInteractiveSelection: true,
          controller: widget.controller,
          keyboardType: widget.inputType,
          textInputAction: widget.inputAction,
          style: Theme.of(context).textTheme.labelLarge,
          readOnly: widget.readOnly,
          decoration: InputDecoration(
              isDense: true,
              contentPadding: const EdgeInsets.only(
                  left: 11, right: 3, top: 14, bottom: 14),
              labelStyle: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(fontWeight: FontWeight.w700),
              labelText: widget.labelText,
              counterText: "",
              errorText: "",
              errorStyle:
                  const TextStyle(fontSize: 0, fontWeight: FontWeight.w100),
              hintText: widget.hintText,
              hintStyle: Theme.of(context).textTheme.labelMedium,
              border: const OutlineInputBorder(borderSide: BorderSide.none),
              errorBorder:
                  const OutlineInputBorder(borderSide: BorderSide.none),
              focusedErrorBorder:
                  const OutlineInputBorder(borderSide: BorderSide.none),
              enabledBorder:
                  const OutlineInputBorder(borderSide: BorderSide.none),
              focusedBorder:
                  const OutlineInputBorder(borderSide: BorderSide.none)),
          onSubmitted: widget.onSubmitted,
        ),
      ),
    );
  }
}

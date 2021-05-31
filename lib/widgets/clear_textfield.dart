import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClearTextFiled extends StatefulWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final String? initialValue;
  final bool autofocus;
  final bool obscureText;
  final int maxLines;
  final int? maxLength;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final FormFieldSetter<String>? onSaved;

  final TextStyle? style;
  final InputDecoration decoration;

  final bool showClear;

  const ClearTextFiled({
    Key? key,
    this.showClear = false,
    this.initialValue,
    this.controller,
    this.focusNode,
    this.keyboardType,
    this.autofocus = false,
    this.obscureText = false,
    this.maxLines = 1,
    this.maxLength,
    this.onChanged,
    this.style,
    this.decoration = const InputDecoration(),
    this.validator,
    this.onSaved,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ClearTextFiledState();
}

class _ClearTextFiledState extends State<ClearTextFiled> {
  late TextEditingController _controller;
  late FocusNode _focusNode;

  TextEditingController get _effectiveController =>
      widget.controller ?? _controller;

  FocusNode get _effectiveFocusNode => widget.focusNode ?? _focusNode;

  bool isShowClear = false;

  @override
  void initState() {
    super.initState();
    if (widget.controller == null) {
      _controller = TextEditingController(text: widget.initialValue);
    }
    if (widget.focusNode == null) {
      _focusNode = FocusNode();
    }
    if (widget.showClear) {
      _effectiveController.addListener(() {
        isShowClear = _effectiveController.text.isNotEmpty &&
            _effectiveFocusNode.hasFocus;
        setState(() {});
      });
      _effectiveFocusNode.addListener(() {
        isShowClear = _effectiveController.text.isNotEmpty &&
            _effectiveFocusNode.hasFocus;
        setState(() {});
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: widget.initialValue,
      controller: _effectiveController,
      focusNode: _effectiveFocusNode,
      keyboardType: widget.keyboardType,
      autofocus: widget.autofocus,
      obscureText: widget.obscureText,
      maxLines: widget.maxLines,
      maxLength: widget.maxLength,
      onChanged: widget.onChanged,
      validator: widget.validator,
      style: widget.style,
      onSaved: widget.onSaved,
      decoration: getDecoration(),
    );
  }

  InputDecoration getDecoration() {
    return widget.decoration.copyWith(
      suffixIcon: Offstage(
        offstage: !isShowClear,
        child: IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            _effectiveController.clear();
          },
        ),
      ),
    );
  }
}

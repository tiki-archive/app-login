/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../modal_recover_service.dart';
import '../modal_recover_style.dart';

class ModalRecoverWidgetPin extends StatefulWidget {
  final int _min;
  final void Function(String) _submit;

  const ModalRecoverWidgetPin(this._submit, {int? min}) : _min = min ?? 6;

  @override
  State<StatefulWidget> createState() => _ModalRecoverWidgetPin(_submit, _min);
}

class _ModalRecoverWidgetPin extends State<ModalRecoverWidgetPin> {
  final int _min;
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _textEditingController = TextEditingController();
  final void Function(String) _submit;

  _ModalRecoverWidgetPin(this._submit, this._min);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: [
      EditableText(
        obscureText: true,
        autofocus: true,
        focusNode: _focusNode,
        cursorColor: Colors.transparent,
        showCursor: false,
        style: TextStyle(color: Colors.transparent),
        backgroundCursorColor: Colors.transparent,
        keyboardType: TextInputType.number,
        keyboardAppearance: Brightness.light,
        inputFormatters: [LengthLimitingTextInputFormatter(_min)],
        controller: _textEditingController,
        onChanged: (s) {
          if (s.length == _min) _submit(s);
          setState(() {});
        },
      ),
      Wrap(alignment: WrapAlignment.center, children: _circles(context))
    ]);
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();
    _textEditingController.dispose();
  }

  List<Widget> _circles(BuildContext context) {
    List<Widget> circles = [];
    for (int i = 0; i < _min; i++) {
      circles.add(_circle(context, i < _textEditingController.text.length));
    }
    return circles;
  }

  Widget _circle(BuildContext context, bool isFill) {
    ModalRecoverStyle style =
        Provider.of<ModalRecoverService>(context, listen: false).style;
    return Container(
        height: style.fontSize * .83,
        width: style.fontSize * .83,
        margin: EdgeInsets.all(style.size(5)),
        decoration: BoxDecoration(
            color: isFill ? style.buttonColor : null,
            shape: BoxShape.circle,
            border: !isFill
                ? Border.all(color: style.buttonColor, width: style.size(2))
                : null));
  }
}
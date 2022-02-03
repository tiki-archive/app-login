/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../modal_recover_service.dart';
import '../modal_recover_style.dart';

class ModalRecoverWidgetPass extends StatefulWidget {
  final int _min;
  final void Function(String) _submit;

  const ModalRecoverWidgetPass(this._submit, {int? min}) : _min = min ?? 8;

  @override
  State<StatefulWidget> createState() => _ModalRecoverWidgetPass(_submit, _min);
}

class _ModalRecoverWidgetPass extends State<ModalRecoverWidgetPass> {
  final int _min;
  final void Function(String) _submit;

  final _controller = TextEditingController();

  _ModalRecoverWidgetPass(this._submit, this._min);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ModalRecoverStyle style =
        Provider.of<ModalRecoverService>(context, listen: false).style;
    return TextField(
        controller: _controller,
        textAlign: TextAlign.center,
        autofocus: true,
        showCursor: false,
        obscureText: true,
        keyboardType: TextInputType.text,
        keyboardAppearance: Brightness.light,
        onEditingComplete: () => _submit(_controller.text),
        decoration: InputDecoration(
            focusedBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(color: style.buttonColor, width: style.size(2))),
            hintText: '$_min+ letters or numbers',
            hintStyle: TextStyle(
                height: 1.2,
                fontWeight: style.textWeight,
                fontSize: style.fontSize,
                fontFamily: style.fontFamily,
                color: style.hintColor,
                fontStyle: FontStyle.normal)),
        style: TextStyle(
            height: 1.2,
            fontWeight: style.textWeight,
            fontSize: style.fontSize,
            fontFamily: style.fontFamily,
            color: style.buttonColor,
            fontStyle: FontStyle.normal));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

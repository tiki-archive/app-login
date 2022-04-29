/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiki_style/tiki_style.dart';

import '../modal_recover_service.dart';
import '../modal_recover_style.dart';

class ModalRecoverWidgetPass extends StatefulWidget {
  final int min;
  final void Function(String) submit;

  const ModalRecoverWidgetPass(this.submit, {Key? key, int? min})
      : min = min ?? 8,
        super(key: key);

  @override
  State<StatefulWidget> createState() => _ModalRecoverWidgetPass();
}

class _ModalRecoverWidgetPass extends State<ModalRecoverWidgetPass> {
  final _controller = TextEditingController();

  _ModalRecoverWidgetPass();

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
        onEditingComplete: () => widget.submit(_controller.text),
        decoration: InputDecoration(
            focusedBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(color: style.buttonColor, width: style.size(2))),
            hintText: '${widget.min}+ letters or numbers',
            hintStyle: TextStyle(
                height: 1.2,
                fontWeight: style.textWeight,
                fontSize: style.fontSize,
                fontFamily: TextProvider.familyNunitoSans,
                package: 'tiki_style',
                color: style.hintColor,
                fontStyle: FontStyle.normal)),
        style: TextStyle(
            height: 1.2,
            fontWeight: style.textWeight,
            fontSize: style.fontSize,
            fontFamily: TextProvider.familyNunitoSans,
            package: 'tiki_style',
            color: style.buttonColor,
            fontStyle: FontStyle.normal));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

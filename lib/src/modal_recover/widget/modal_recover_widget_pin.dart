/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tiki_style/tiki_style.dart';

class ModalRecoverWidgetPin extends StatefulWidget {
  final int min;
  final void Function(String) submit;

  const ModalRecoverWidgetPin(this.submit, {int? min, Key? key})
      : min = min ?? 6,
        super(key: key);

  @override
  State<StatefulWidget> createState() => _ModalRecoverWidgetPin();
}

class _ModalRecoverWidgetPin extends State<ModalRecoverWidgetPin> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _textEditingController = TextEditingController();

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
        style: const TextStyle(color: Colors.transparent),
        backgroundCursorColor: Colors.transparent,
        keyboardType: TextInputType.number,
        keyboardAppearance: Brightness.light,
        inputFormatters: [LengthLimitingTextInputFormatter(widget.min)],
        controller: _textEditingController,
        onChanged: (s) {
          if (s.length == widget.min) widget.submit(s);
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
    for (int i = 0; i < widget.min; i++) {
      circles.add(_circle(context, i < _textEditingController.text.length));
    }
    return circles;
  }

  Widget _circle(BuildContext context, bool isFill) {
    return Container(
        height: SizeProvider.instance.text(18) * .83,
        width: SizeProvider.instance.text(18) * .83,
        margin: EdgeInsets.all(SizeProvider.instance.width(5)),
        decoration: BoxDecoration(
            color: isFill ? ColorProvider.orange : null,
            shape: BoxShape.circle,
            border: !isFill
                ? Border.all(
                    color: ColorProvider.orange,
                    width: SizeProvider.instance.width(2))
                : null));
  }
}

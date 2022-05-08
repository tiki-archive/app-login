/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:tiki_style/tiki_style.dart';

import '../../utils/utils_icons.dart';
import '../modal_recover_service.dart';
import '../widget/modal_recover_widget_text.dart';

class ModalRecoverUiViewCreating extends StatefulWidget {
  const ModalRecoverUiViewCreating({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ModalRecoverUiViewCreating();
}

class _ModalRecoverUiViewCreating extends State<ModalRecoverUiViewCreating> {
  static const String _title = 'Creating your account...';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      ModalRecoverService service =
          Provider.of<ModalRecoverService>(context, listen: false);
      await Future.wait(
          [service.generate(), Future.delayed(Duration(seconds: 2))]);
      service.controller.showBackup();
    });
  }

  @override
  Widget build(BuildContext context) {
    ModalRecoverService service =
        Provider.of<ModalRecoverService>(context, listen: false);
    return Container(
        padding: EdgeInsets.only(top: service.style.size(8)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: service.controller.showAccount,
                    child: Icon(UtilsIcons.arrow,
                        size: service.style.modalNavIconSize,
                        color: service.style.modalNavColor)),
                TextButton(
                    onPressed: () => service.controller.close(context),
                    child: Icon(UtilsIcons.x,
                        size: service.style.modalNavIconSize,
                        color: service.style.modalNavColor))
              ],
            ),
            Container(
                height: service.style.modalContainerHeight,
                padding: EdgeInsets.all(service.style.modalContentPadding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        padding:
                            EdgeInsets.only(bottom: service.style.size(10)),
                        child: ModalRecoverWidgetText(_title)),
                    Expanded(
                        child: FittedBox(
                          fit: BoxFit.fitHeight,
                          child: ClipRect(
                            child: Align(
                                alignment: Alignment.center,
                                heightFactor: 0.66,
                                widthFactor: 1,
                                child: ConstrainedBox(
                                    constraints:
                                        const BoxConstraints(minWidth: 1, minHeight: 1),
                                    child: AnimationProvider.recoverCreating,
                                )
                          ),
                        ))),
                      ],
                    ))
          ],
        ));
  }

  @override
  void dispose() {
    super.dispose();
  }
}

import 'package:flutter/material.dart';

import '../index.dart';

AppBar XAppBar(
  context, {
  String? title,
  PreferredSizeWidget? bottom,
  Widget? subTitle,
  Widget? titleWidget,
  double? tWidth,
  double? tHeight,
  Function? willPopFn,
  Widget? backWidget,
  Function? backWidgetFn,
  List<Widget>? actions,
  bool? elevation,
  bool? hiddenLeading,
      double? LeadingWidth,
}) {
  onPressed() async {
    if (backWidgetFn == null) {
      var pop = await willPopFn?.call();
      var canPop = pop == null || pop;
      if (Navigator.canPop(context) && canPop) {
        Navigator.pop(context);
      } else {
        if (canPop) {
          XUtil.flutterPop();
        }
      }
    } else {
      backWidgetFn.call();
    }
  }

  return AppBar(
    backgroundColor: themeColor.ffFFFFFF,
    title: titleWidget ??
        (Stack(
          alignment: AlignmentDirectional.center,
          children: [
            subTitle ?? const SizedBox(width: 0, height: 0),
            Text(
              '$title',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(color: themeColor.ff0E1424, fontWeight: FontWeight.w500),
            ),
          ],
        ).background(width: tWidth, height: tHeight)),
    centerTitle: titleWidget == null ? true : false,
    elevation: elevation ?? false ? 1.w : 0,
    toolbarHeight: bottom == null ? 44 : 88,
    leadingWidth: hiddenLeading == true ?0: LeadingWidth,
    leading: hiddenLeading == true
        ? Container()
        : (backWidget == null
            ? IconButton(
                color: Colors.black,
                icon: Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                ),
                onPressed: onPressed,
              )
            : XButton(
                callback: backWidgetFn ?? onPressed,
                child: backWidget,
              )),
    actions: actions ?? [const SizedBox(width: 44)],
    bottom: bottom,
  );
}
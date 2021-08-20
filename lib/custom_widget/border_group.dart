import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 给多个组件之间添加分割线
///
/// ## Simple code
/// ```dart
///              BorderGroup(
///                indent: 16.0,
///                showBorderTop: false,
///                showBorderBottom: false,
///                children: <Widget>[
///                  ListLabelItem(title: '一段内容'),
///                  ListLabelItem(title: '一段内容'),
///                  ListLabelItem(title: '一段内容'),
///                  ListLabelItem(title: '一段内容'),
///                ],
///              )
/// ```
///
/// <img src="http://me.wozaihui.com/BorderGroup.png">
///
class BorderGroup extends StatelessWidget {
  final bool showBorderTop;
  final bool showBorderBottom;
  final List<Widget>? children;

  /// 左边不显示分割线的间距
  final double indent;
  final Divider divider;

  BorderGroup({
    this.children,
    this.showBorderTop = false,
    this.showBorderBottom = false,
    this.indent = 0.0,
    divider,
    Key? key,
  })  : divider = divider ??
            Divider(
              indent: indent,
              color: Color(0xFFE0E0E0),
              height: 0.5,
            ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return children != null
        ? Column(mainAxisSize: MainAxisSize.min, children: _renderChildren())
        : SizedBox();
  }

  List<Widget> _renderChildren() {
    final List<Widget> widgets = [];
    if (showBorderTop) widgets.add(divider);
    for (var i = 0; i < children!.length; i++) {
      if (i != 0) widgets.add(divider);
      widgets.add(children![i]);
    }
    if (showBorderBottom) widgets.add(divider);
    return widgets;
  }
}

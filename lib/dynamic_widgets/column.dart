import 'package:flutter/material.dart';

import 'basic/handler.dart';
import 'basic/utils.dart';
import 'basic/widget.dart';
import 'config/widget_config.dart';

/// Column handler
class ColumnHandler extends DynamicBasicWidgetHandler {

  @override
  String get widgetName => 'Column';

  @override
  Widget build(DynamicWidgetConfig? config,
      {Key? key, required BuildContext buildContext}) {
    return _Builder(config, key: key);
  }

  @override
  Map? transformJson(Widget? widget, BuildContext? buildContext) {
    var column = widget as Column?;
    if (column == null) return null;
    return {
      'widget': widgetName,
      'children': DynamicWidgetBuilder.transformList(column.children, buildContext),
      'xVar': {
        'mainAxisAlignment': DynamicWidgetUtils.transformMainAxisAlignment(column.mainAxisAlignment),
        'mainAxisSize': DynamicWidgetUtils.transformMainAxisSize(column.mainAxisSize),
        'crossAxisAlignment': DynamicWidgetUtils.transformCrossAxisAlignment(column.crossAxisAlignment),
        'textDirection': DynamicWidgetUtils.transformTextDirection(column.textDirection),
        'verticalDirection': DynamicWidgetUtils.transformVerticalDirection(column.verticalDirection),
        'textBaseline': DynamicWidgetUtils.transformTextBaseline(column.textBaseline),
      },
      'xKey': column.key.toString()
    };
  }

  @override
  Type get widgetType => Column;
}

class _Builder extends DynamicBaseWidget {
  final DynamicWidgetConfig? config;

  _Builder(this.config, {Key? key}) : super(config, key: key);

  @override
  _BuilderState createState() => _BuilderState();
}

class _BuilderState extends State<_Builder> {
  ColumnConfig? props;

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.config?.xVar != null) {
      props = ColumnConfig.fromJson(widget.config?.xVar ?? {});
    }
    List<Widget> _children = DynamicWidgetBuilder.buildWidgets(widget.config?.children, context: context);

    return Column(
      key: widget.config?.xKey != null ? Key(widget.config!.xKey!) : null,
      mainAxisAlignment: props?.mainAxisAlignment ?? MainAxisAlignment.start,
      mainAxisSize: props?.mainAxisSize ?? MainAxisSize.max,
      crossAxisAlignment: props?.crossAxisAlignment ?? CrossAxisAlignment.center,
      textDirection: props?.textDirection,
      verticalDirection: props?.verticalDirection ?? VerticalDirection.down,
      textBaseline: props?.textBaseline,
      children: _children,
    );
  }

}

/// The props of Column config
class ColumnConfig {
  late MainAxisAlignment? mainAxisAlignment;
  late MainAxisSize? mainAxisSize;
  late CrossAxisAlignment? crossAxisAlignment;
  late TextDirection? textDirection;
  late VerticalDirection? verticalDirection;
  late TextBaseline? textBaseline;

  ColumnConfig(
      {this.mainAxisAlignment,
        this.mainAxisSize,
        this.crossAxisAlignment,
        this.textDirection,
        this.verticalDirection,
        this.textBaseline});

  ColumnConfig.fromJson(Map<dynamic, dynamic> json) {
    mainAxisAlignment = DynamicWidgetUtils.mainAxisAlignmentAdapter(json['mainAxisAlignment']);
    mainAxisSize = DynamicWidgetUtils.mainAxisSizeAdapter(json['mainAxisSize']);
    crossAxisAlignment = DynamicWidgetUtils.crossAxisAlignmentAdapter(json['crossAxisAlignment']);
    textDirection = DynamicWidgetUtils.textDirectionAdapter(json['textDirection']);
    verticalDirection = DynamicWidgetUtils.verticalDirectionAdapter(json['verticalDirection']);
    textBaseline = DynamicWidgetUtils.textBaselineAdapter(json['textBaseline']);

  }

}
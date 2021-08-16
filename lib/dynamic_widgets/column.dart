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
    List<Widget> _children = [];
    if (widget.config?.propsList != null) {
      widget.config?.propsList?.forEach((e) {
        Widget? _child = DynamicWidgetUtils.buildWidget(e, context: context);
        if (_child != null) {
          _children.add(_child);
        }
      });
    }

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
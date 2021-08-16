import 'package:flutter/cupertino.dart';

import 'basic/handler.dart';
import 'basic/utils.dart';
import 'basic/widget.dart';
import 'config/widget_config.dart';

/// Row handler
class RowHandler extends DynamicBasicWidgetHandler {

  @override
  String get widgetName => 'Row';

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
  RowConfig? props;

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.config?.xVar != null) {
      props = RowConfig.fromJson(widget.config?.xVar ?? {});
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

    return Row(
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

/// The props of Row config
class RowConfig {
  late MainAxisAlignment? mainAxisAlignment;
  late MainAxisSize? mainAxisSize;
  late CrossAxisAlignment? crossAxisAlignment;
  late TextDirection? textDirection;
  late VerticalDirection? verticalDirection;
  late TextBaseline? textBaseline;

  RowConfig(
      {this.mainAxisAlignment,
      this.mainAxisSize,
      this.crossAxisAlignment,
      this.textDirection,
      this.verticalDirection,
        this.textBaseline});

  RowConfig.fromJson(Map<dynamic, dynamic> json) {
    mainAxisAlignment = DynamicWidgetUtils.mainAxisAlignmentAdapter(json['mainAxisAlignment']);
    mainAxisSize = DynamicWidgetUtils.mainAxisSizeAdapter(json['mainAxisSize']);
    crossAxisAlignment = DynamicWidgetUtils.crossAxisAlignmentAdapter(json['crossAxisAlignment']);
    textDirection = DynamicWidgetUtils.textDirectionAdapter(json['textDirection']);
    verticalDirection = DynamicWidgetUtils.verticalDirectionAdapter(json['verticalDirection']);
    textBaseline = DynamicWidgetUtils.textBaselineAdapter(json['textBaseline']);
  }

}
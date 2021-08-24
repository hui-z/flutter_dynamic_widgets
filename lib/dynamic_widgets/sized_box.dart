import 'package:flutter/material.dart';

import 'basic/handler.dart';
import 'basic/utils.dart';
import 'basic/widget.dart';
import 'config/widget_config.dart';

class SizedBoxHandler extends DynamicBasicWidgetHandler {
  @override
  String get widgetName => 'SizedBox';

  @override
  Type get widgetType => SizedBox;

  @override
  Widget build(DynamicWidgetConfig? config,
      {Key? key,
        required BuildContext buildContext,
        Function(String value)? event}) {
    return _Builder(config, event, key: key);
  }

  @override
  Map? transformJson(Widget? widget, BuildContext? buildContext) {
    var realWidget = widget as SizedBox?;
    if (realWidget == null) return null;
    return {
      'widget': widgetName,
      'child':
      DynamicWidgetBuilder.transformMap(realWidget.child, buildContext),
      'xVar': {
        'width': realWidget.width,
        'height': realWidget.height,
      },
      'xKey': realWidget.key.toString()
    };
  }
}

class _Builder extends DynamicBaseWidget {
  final DynamicWidgetConfig? config;
  final Function(String value)? event;

  _Builder(this.config, this.event, {Key? key})
      : super(config, event, key: key);

  @override
  _BuilderState createState() => _BuilderState();
}

class _BuilderState extends State<_Builder> {
  SizedBoxConfig? props;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.config?.xVar != null) {
      props = SizedBoxConfig.fromJson(widget.config?.xVar ?? {});
    }
    return SizedBox(
      key: widget.config?.xKey != null ? Key(widget.config!.xKey!) : null,
      width: props?.width,
      height: props?.height,
      child: DynamicWidgetBuilder.buildWidget(widget.config?.child,
          context: context, event: widget.event),
    );
  }
}

class SizedBoxConfig {
  late double? width;
  late double? height;

  SizedBoxConfig.fromJson(Map<dynamic, dynamic> json) {
    width = json['width']?.toDouble();
    height = json['height']?.toDouble();
  }
}

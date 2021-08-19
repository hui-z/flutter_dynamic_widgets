import 'package:flutter/material.dart';

import 'basic/handler.dart';
import 'basic/utils.dart';
import 'basic/widget.dart';
import 'config/widget_config.dart';

class AspectRatioHandler extends DynamicBasicWidgetHandler {
  @override
  String get widgetName => 'AspectRatio';

  @override
  Widget build(DynamicWidgetConfig? config,
      {Key? key, required BuildContext buildContext, Function(String value)? event}) {
    return _Builder(config, event, key: key);
  }

  @override
  Map? transformJson(Widget? widget, BuildContext? buildContext) {
    var realWidget = widget as AspectRatio?;
    if (realWidget == null) return null;
    return {
      'widget': widgetName,
      'child': DynamicWidgetBuilder.transformMap(
          realWidget.child, buildContext),
      'xVar': {
        'aspectRatio': realWidget.aspectRatio,
      },
      'xKey': realWidget.key.toString()
    };
  }

  @override
  Type get widgetType => AspectRatio;
}

class _Builder extends DynamicBaseWidget {
  final DynamicWidgetConfig? config;
  final Function(String value)? event;

  _Builder(this.config, this.event, {Key? key}) : super(config, event, key: key);

  @override
  _BuilderState createState() => _BuilderState();
}

class _BuilderState extends State<_Builder> {
  AspectRatioConfig? props;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.config?.xVar != null) {
      props = AspectRatioConfig.fromJson(widget.config?.xVar ?? {});
    }
    return AspectRatio(
      key: widget.config?.xKey != null ? Key(widget.config!.xKey!) : null,
      aspectRatio:props?.aspectRatio??0.0,
      child: DynamicWidgetBuilder.buildWidget(widget.config?.child, context: context),
    );
  }
}

class AspectRatioConfig {
  late double? aspectRatio;

  AspectRatioConfig.fromJson(Map<dynamic, dynamic> json) {
    aspectRatio = json["aspectRatio"]?.toDouble();
  }
}
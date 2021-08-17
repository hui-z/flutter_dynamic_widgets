import 'package:flutter/material.dart';

import 'basic/handler.dart';
import 'basic/utils.dart';
import 'basic/widget.dart';
import 'config/widget_config.dart';

/// Column handler
class PaddingHandler extends DynamicBasicWidgetHandler {
  @override
  String get widgetName => 'Padding';

  @override
  Widget build(DynamicWidgetConfig? config,
      {Key? key, required BuildContext buildContext, Function(String value)? event}) {
    return _Builder(config, event, key: key);
  }

  @override
  Map? transformJson(Widget? widget, BuildContext? buildContext) {
    var padding = widget as Padding?;
    if (padding == null) return null;
    return {
      'widget': widgetName,
      'child': DynamicWidgetBuilder.transformMap(padding.child, buildContext),
      'xVar': {
        'padding': DynamicWidgetUtils.transformEdgeInset(padding.padding as EdgeInsets?)
      },
      'xKey': padding.key.toString()
    };
  }

  @override
  Type get widgetType => Padding;
}

class _Builder extends DynamicBaseWidget {
  final DynamicWidgetConfig? config;
  final Function(String value)? event;

  _Builder(this.config, this.event, {Key? key}) : super(config, event, key: key);

  @override
  _BuilderState createState() => _BuilderState();
}

class _BuilderState extends State<_Builder> {
  PaddingConfig? props;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.config?.xVar != null) {
      props = PaddingConfig.fromJson(widget.config?.xVar ?? {});
    }
    Widget? _child = DynamicWidgetBuilder.buildWidget(widget.config?.child,
        context: context, event: widget.event);

    return Padding(
      key: widget.config?.xKey != null ? Key(widget.config!.xKey!) : null,
      padding: props?.padding ?? const EdgeInsets.all(0.0),
      child: _child ?? SizedBox(),
    );
  }
}

/// The props of Column config
class PaddingConfig {
  late EdgeInsetsGeometry? padding;

  PaddingConfig({this.padding});

  PaddingConfig.fromJson(Map<dynamic, dynamic> json) {
    padding = DynamicWidgetUtils.edgeInsetAdapter(json['padding']);
  }
}

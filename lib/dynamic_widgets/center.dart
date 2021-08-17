import 'package:flutter/material.dart';

import 'basic/handler.dart';
import 'basic/utils.dart';
import 'basic/widget.dart';
import 'config/widget_config.dart';

/// Column handler
class CenterHandler extends DynamicBasicWidgetHandler {
  @override
  String get widgetName => 'Center';

  @override
  Widget build(DynamicWidgetConfig? config,
      {Key? key, required BuildContext buildContext, Function(String value)? event}) {
    return _Builder(config, event, key: key);
  }

  @override
  Map? transformJson(Widget? widget, BuildContext? buildContext) {
    var center = widget as Center?;
    if (center == null) return null;
    return {
      'widget': widgetName,
      'child': DynamicWidgetBuilder.transformMap(center.child, buildContext),
      'xVar': {
        'widthFactor': center.widthFactor,
        'heightFactor': center.heightFactor,
      },
      'xKey': center.key.toString()
    };
  }

  @override
  Type get widgetType => Center;
}

class _Builder extends DynamicBaseWidget {
  final DynamicWidgetConfig? config;
  final Function(String value)? event;

  _Builder(this.config, this.event, {Key? key}) : super(config, event, key: key);

  @override
  _BuilderState createState() => _BuilderState();
}

class _BuilderState extends State<_Builder> {
  CenterConfig? props;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.config?.xVar != null) {
      props = CenterConfig.fromJson(widget.config?.xVar ?? {});
    }
    Widget? _child = DynamicWidgetBuilder.buildWidget(widget.config?.child,
        context: context, event: widget.event);

    return Center(
      key: widget.config?.xKey != null ? Key(widget.config!.xKey!) : null,
      widthFactor: props?.widthFactor,
      heightFactor: props?.heightFactor,
      child: _child ?? SizedBox(),
    );
  }
}

/// The props of Column config
class CenterConfig {
  late double? widthFactor;
  late double? heightFactor;

  CenterConfig({this.widthFactor, this.heightFactor});

  CenterConfig.fromJson(Map<dynamic, dynamic> json) {
    widthFactor = json['widthFactor'];
    heightFactor = json['heightFactor'];
  }
}

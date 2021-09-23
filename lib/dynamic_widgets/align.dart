import 'package:flutter/material.dart';

import 'basic/handler.dart';
import 'basic/utils.dart';
import 'basic/widget.dart';
import 'config/event_name.dart';
import 'config/widget_config.dart';

class AlignHandler extends DynamicBasicWidgetHandler {
  @override
  String get widgetName => 'Align';

  @override
  Type get widgetType => Align;

  @override
  Widget build(DynamicWidgetConfig? config,
      {Key? key,
        required BuildContext buildContext,
        Function(EventInfo value)? event}) {
    return _Builder(config, event, key: key);
  }

  @override
  Map? transformJson(Widget? widget, BuildContext? buildContext) {
    return Config.toJson(widget, widgetName, buildContext);
  }
}

class _Builder extends DynamicBaseWidget {
  final DynamicWidgetConfig? config;
  final Function(EventInfo value)? event;

  _Builder(this.config, this.event, {Key? key})
      : super(config, event, key: key);

  @override
  _BuilderState createState() => _BuilderState();
}

class _BuilderState extends State<_Builder> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Config.toWidget(context, widget);
  }
}

class Config {
  late double? widthFactor;
  late double? heightFactor;
  late AlignmentGeometry? alignment;

  Config.fromJson(Map<dynamic, dynamic> json) {
    widthFactor = DynamicWidgetUtils.adaptDouble(json['widthFactor']);
    heightFactor = DynamicWidgetUtils.adaptDouble(json['heightFactor']);
    alignment = DynamicWidgetUtils.adapt<Alignment>(json['alignment']);
  }

  static Widget toWidget(BuildContext context, _Builder widget) {
    Config? props;
    if (widget.config?.xVar != null) {
      props = Config.fromJson(widget.config?.xVar ?? {});
    }
    Widget? _child = DynamicWidgetBuilder.buildWidget(widget.config?.child,
        context: context, event: widget.event);

    return Align(
      key: widget.config?.xKey != null ? Key(widget.config!.xKey!) : null,
      alignment: props?.alignment ?? Alignment.center,
      widthFactor: props?.widthFactor,
      heightFactor: props?.heightFactor,
      child: _child ?? SizedBox(),
    );
  }

  static Map? toJson(Widget? widget, String widgetName,
      BuildContext? buildContext) {
    var align = widget as Align?;
    if (align == null) return null;
    return {
      'widget': widgetName,
      'child': DynamicWidgetBuilder.transformMap(align.child, buildContext),
      'xVar': {
        'widthFactor': DynamicWidgetUtils.transform(align.widthFactor),
        'heightFactor': DynamicWidgetUtils.transform(align.heightFactor),
        'alignment': DynamicWidgetUtils.transform(
            align.alignment as Alignment?),
      },
      'xKey': align.key.toString()
    };
  }
}
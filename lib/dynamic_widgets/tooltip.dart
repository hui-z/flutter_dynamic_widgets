import 'package:flutter/material.dart';

import 'basic/handler.dart';
import 'basic/utils.dart';
import 'basic/widget.dart';
import 'config/event.dart';
import 'config/widget_config.dart';

class TooltipHandler extends DynamicBasicWidgetHandler {
  @override
  String get widgetName => 'Tooltip';

  @override
  Type get widgetType => Tooltip;

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
  late String? message;
  late double? height;
  late EdgeInsetsGeometry? padding;
  late EdgeInsetsGeometry? margin;
  late double? verticalOffset;
  late bool? preferBelow;
  late bool? excludeFromSemantics;

  //late Decoration? decoration;
  late TextStyle? textStyle;
  late Duration? waitDuration;
  late Duration? showDuration;

  // late Widget? child;

  Config.fromJson(Map<dynamic, dynamic> json) {
    message = json['message'];
    height = json['height']?.toDouble();
    padding = DynamicWidgetUtils.adapt<EdgeInsets>(json['padding']);
    margin = DynamicWidgetUtils.adapt<EdgeInsets>(json['margin']);
    verticalOffset = json['verticalOffset']?.toDouble();
    preferBelow = json['preferBelow'];
    excludeFromSemantics = json['excludeFromSemantics'];
    //decoration
    textStyle = DynamicWidgetUtils.adapt<TextStyle>(json['textStyle']);
    waitDuration = DynamicWidgetUtils.adapt<Duration>(json['waitDuration']);
    showDuration = DynamicWidgetUtils.adapt<Duration>(json['showDuration']);
  }

  static Widget toWidget(BuildContext context, _Builder widget) {
    Config? props;
    if (widget.config?.xVar != null) {
      props = Config.fromJson(widget.config?.xVar ?? {});
    }
    return Tooltip(
      key: widget.config?.xKey != null ? Key(widget.config!.xKey!) : null,
      message: props?.message ?? '',
      height: props?.height,
      padding: props?.padding,
      margin: props?.margin,
      verticalOffset: props?.verticalOffset,
      preferBelow: props?.preferBelow,
      excludeFromSemantics: props?.excludeFromSemantics,
      textStyle: props?.textStyle,
      waitDuration: props?.waitDuration,
      showDuration: props?.showDuration,
      child: DynamicWidgetBuilder.buildWidget(widget.config?.child,
          context: context, event: widget.event),
    );
  }

  static Map? toJson(Widget? realWidget, String widgetName,
      BuildContext? buildContext) {
    var widget = realWidget as Tooltip?;
    if (widget == null) return null;
    return {
      'widget': widgetName,
      'child': DynamicWidgetBuilder.transformMap(widget.child, buildContext),
      'xVar': {
        'message': widget.message,
        'height': widget.height,
        'padding': DynamicWidgetUtils.transform(widget.padding as EdgeInsets),
        'margin': DynamicWidgetUtils.transform(widget.margin as EdgeInsets),
        'verticalOffset': widget.verticalOffset,
        'preferBelow': widget.preferBelow,
        'excludeFromSemantics': widget.excludeFromSemantics,
        'textStyle': DynamicWidgetUtils.transform(widget.textStyle),
        'waitDuration': DynamicWidgetUtils.transform(widget.waitDuration),
        'showDuration': DynamicWidgetUtils.transform(widget.showDuration),
      },
      'xKey': widget.key.toString()
    };
  }
}
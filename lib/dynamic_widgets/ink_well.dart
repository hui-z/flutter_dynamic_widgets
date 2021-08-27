import 'package:flutter/material.dart';

import 'basic/handler.dart';
import 'basic/utils.dart';
import 'basic/widget.dart';
import 'config/event_name.dart';
import 'config/widget_config.dart';

class InkWellHandler extends DynamicBasicWidgetHandler {
  @override
  String get widgetName => 'InkWell';

  @override
  Widget build(DynamicWidgetConfig? config,
      {Key? key,
      required BuildContext buildContext,
      Function(String value)? event}) {
    return _Builder(config, event, key: key);
  }

  @override
  Map? transformJson(Widget? widget, BuildContext? buildContext) {
    var inkWell = widget as InkWell?;
    if (inkWell == null) return null;
    return {
      'widget': widgetName,
      'xVar': {
        'focusColor': DynamicWidgetUtils.transform(inkWell.focusColor),
        'hoverColor': DynamicWidgetUtils.transform(inkWell.hoverColor),
        'highlightColor': DynamicWidgetUtils.transform(inkWell.highlightColor),
        'splashColor': DynamicWidgetUtils.transform(inkWell.splashColor),
        'radius': inkWell.radius,
        'borderRadius':
            DynamicWidgetUtils.transform(inkWell.borderRadius as EdgeInsets?),
        'customBorder': DynamicWidgetUtils.transform(
            inkWell.customBorder as RoundedRectangleBorder?),
        'autofocus': inkWell.autofocus,
        'enableFeedback': inkWell.enableFeedback,
      },
      'xKey': inkWell.key.toString()
    };
  }

  @override
  Type get widgetType => InkWell;
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
  InkWellConfig? props;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.config?.xVar != null) {
      props = InkWellConfig.fromJson(widget.config?.xVar ?? {});
    }
    var eventName1 = widget.config?.eventNames?.firstWhere(
            (element) => element.contains(EventName.onTap), orElse: () => '');

    var onTap = eventName1 != null && eventName1.isNotEmpty
        ? () {
      if (widget.event != null) {
        widget.event!(eventName1);
      }
    }
        : null;

    var eventName2 = widget.config?.eventNames?.firstWhere(
            (element) => element.contains(EventName.onLongPress), orElse: () => '');

    var onLongPress =
    eventName2 != null && eventName2.isNotEmpty
        ? () {
      if (widget.event != null) {
        widget.event!(eventName2);
      }
    }
        : null;

    var eventName3 = widget.config?.eventNames?.firstWhere(
            (element) => element.contains(EventName.onDoubleTap), orElse: () => '');
    var onDoubleTap =
    eventName3 != null && eventName3.isNotEmpty
        ? () {
      if (widget.event != null) {
        widget.event!(eventName3);
      }
    }
        : null;
    return InkWell(
      key: widget.config?.xKey != null ? Key(widget.config!.xKey!) : null,
      child: DynamicWidgetBuilder.buildWidget(widget.config?.child,
          context: context, event: widget.event),
      onTap: onTap,
      onDoubleTap: onDoubleTap,
      onLongPress: onLongPress,
      focusColor: props?.focusColor,
      hoverColor: props?.hoverColor,
      highlightColor: props?.highlightColor,
      splashColor: props?.splashColor,
      autofocus: props?.autofocus ?? false,
      radius: props?.radius,
      borderRadius: props?.borderRadius,
      customBorder: props?.customBorder,
      enableFeedback: props?.enableFeedback ?? true,
    );
  }
}

class InkWellConfig {
  late Color? focusColor;
  late Color? hoverColor;
  late Color? highlightColor;
  late Color? splashColor;
  late double? radius;
  late BorderRadius? borderRadius;
  late RoundedRectangleBorder? customBorder;
  late bool? autofocus;
  late bool? enableFeedback;

  InkWellConfig.fromJson(Map<dynamic, dynamic> json) {
    focusColor = DynamicWidgetUtils.adapt<Color>(json['focusColor']);
    hoverColor = DynamicWidgetUtils.adapt<Color>(json['hoverColor']);
    highlightColor = DynamicWidgetUtils.adapt<Color>(json['highlightColor']);
    splashColor = DynamicWidgetUtils.adapt<Color>(json['splashColor']);
    radius = json['radius'];
    borderRadius = DynamicWidgetUtils.adapt<BorderRadius>(json['borderRadius']);
    customBorder =
        DynamicWidgetUtils.adapt<RoundedRectangleBorder>(json['customBorder']);
    autofocus = json['autofocus'];
    enableFeedback = json['enableFeedback'];
  }
}

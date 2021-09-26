import 'package:flutter/material.dart';

import 'basic/handler.dart';
import 'basic/utils.dart';
import 'basic/widget.dart';
import 'config/event.dart';
import 'config/widget_config.dart';

class InkWellHandler extends DynamicBasicWidgetHandler {
  @override
  String get widgetName => 'InkWell';

  @override
  Type get widgetType => InkWell;

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
  late Color? focusColor;
  late Color? hoverColor;
  late Color? highlightColor;
  late Color? splashColor;
  late double? radius;
  late BorderRadius? borderRadius;
  late RoundedRectangleBorder? customBorder;
  late bool? autofocus;
  late bool? enableFeedback;

  Config.fromJson(Map<dynamic, dynamic> json) {
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

  static Widget toWidget(BuildContext context, _Builder widget) {
    Config? props;
    if (widget.config?.xVar != null) {
      props = Config.fromJson(widget.config?.xVar ?? {});
    }
    var eventInfo1 = widget.config?.events.firstWhere(
            (element) => element.type == EventType.onTap,
        orElse: () => EventInfo(type: '', action: ''));

    var onTap = eventInfo1?.type != null && eventInfo1?.type != ''
        ? () {
      if (widget.event != null) {
        widget.event!(eventInfo1!);
      }
    }
        : null;

    var eventInfo2 = widget.config?.events.firstWhere(
            (element) => element.type == EventType.onLongPress,
        orElse: () => EventInfo(type: '', action: ''));

    var onLongPress = eventInfo2?.type != null && eventInfo2?.type != ''
        ? () {
      if (widget.event != null) {
        widget.event!(eventInfo2!);
      }
    }
        : null;

    var eventInfo3 = widget.config?.events.firstWhere(
            (element) => element.type == EventType.onDoubleTap,
        orElse: () => EventInfo(type: '', action: ''));
    var onDoubleTap = eventInfo3?.type != null && eventInfo3?.type != ''
        ? () {
      if (widget.event != null) {
        widget.event!(eventInfo3!);
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

  static Map? toJson(Widget? widget, String widgetName,
      BuildContext? buildContext) {
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
}

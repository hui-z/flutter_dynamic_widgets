import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dynamic_widgets/dynamic_widgets/config/event.dart';

import 'basic/handler.dart';
import 'basic/utils.dart';
import 'basic/widget.dart';
import 'config/widget_config.dart';

class RawMaterialButtonHandler extends DynamicBasicWidgetHandler {
  @override
  String get widgetName => 'RawMaterialButton';

  @override
  Type get widgetType => RawMaterialButton;

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
  late TextStyle? textStyle;
  late Color? fillColor;
  late Color? focusColor;
  late Color? hoverColor;
  late Color? highlightColor;
  late Color? splashColor;
  late double? elevation;
  late double? focusElevation;
  late double? hoverElevation;
  late double? highlightElevation;
  late double? disabledElevation;
  late EdgeInsetsGeometry? padding;
  late BoxConstraints? constraints;
  late RoundedRectangleBorder? shape;
  late Duration? animationDuration;
  late Clip? clipBehavior;
  late bool? autofocus;
  late bool? enableFeedback;

  Config.fromJson(Map<dynamic, dynamic> json) {
    textStyle = DynamicWidgetUtils.adapt<TextStyle>(json['textStyle']);
    fillColor = DynamicWidgetUtils.adapt<Color>(json['fillColor']);
    focusColor = DynamicWidgetUtils.adapt<Color>(json['focusColor']);
    hoverColor = DynamicWidgetUtils.adapt<Color>(json['hoverColor']);
    highlightColor = DynamicWidgetUtils.adapt<Color>(json['highlightColor']);
    splashColor = DynamicWidgetUtils.adapt<Color>(json['splashColor']);
    elevation = DynamicWidgetUtils.adaptDouble(json['elevation']?.toDouble());
    focusElevation = DynamicWidgetUtils.adaptDouble(json['focusElevation']?.toDouble());
    hoverElevation = DynamicWidgetUtils.adaptDouble(json['hoverElevation']?.toDouble());
    highlightElevation = DynamicWidgetUtils.adaptDouble(json['highlightElevation']?.toDouble());
    disabledElevation = DynamicWidgetUtils.adaptDouble(json['disabledElevation']?.toDouble());
    padding = DynamicWidgetUtils.adapt<EdgeInsets>(json['padding']);
    constraints = DynamicWidgetUtils.adapt<BoxConstraints>(json['constraints']);
    shape = DynamicWidgetUtils.adapt<RoundedRectangleBorder>(json['shape']);
    animationDuration =
        DynamicWidgetUtils.adapt<Duration>(json['animationDuration']);
    clipBehavior = DynamicWidgetUtils.adapt<Clip>(json['clipBehavior']);
    autofocus = json['autofocus'];
    enableFeedback = json['enableFeedback'];
  }

  static Widget toWidget(BuildContext context, _Builder widget) {
    Config? props;
    if (widget.config?.xVar != null) {
      props = Config.fromJson(widget.config?.xVar ?? {});
    }
    Widget _widget;
    Widget child = DynamicWidgetBuilder.buildWidget(widget.config?.child,
        context: context, event: widget.event) ??
        Container();

    _widget = RawMaterialButton(
      key: widget.config?.xKey != null ? Key(widget.config!.xKey!) : null,
      onPressed: () {
        var eventInfo = widget.config?.events.firstWhere(
                (element) => element.type == EventType.onTap,
            orElse: () => EventInfo(type: '', action: ''));
        if (eventInfo?.type != null &&
            eventInfo?.type != '' &&
            widget.event != null) {
          widget.event!(eventInfo!);
        }
      },
      onLongPress: () {
        var eventInfo = widget.config?.events.firstWhere(
                (element) => element.type == EventType.onLongPress,
            orElse: () => EventInfo(type: '', action: ''));
        if (eventInfo?.type != null &&
            eventInfo?.type != '' &&
            widget.event != null) {
          widget.event!(eventInfo!);
        }
      },
      fillColor: props?.fillColor,
      textStyle: props?.textStyle,
      focusColor: props?.focusColor,
      hoverColor: props?.hoverColor,
      highlightColor: props?.highlightColor,
      splashColor: props?.splashColor,
      elevation: props?.elevation ?? 2.0,
      focusElevation: props?.focusElevation ?? 4.0,
      hoverElevation: props?.hoverElevation ?? 4.0,
      highlightElevation: props?.highlightElevation ?? 8.0,
      disabledElevation: props?.disabledElevation ?? 0.0,
      padding: props?.padding ?? EdgeInsets.zero,
      constraints:
      props?.constraints ?? BoxConstraints(minWidth: 88.0, minHeight: 36.0),
      shape: props?.shape ?? const RoundedRectangleBorder(),
      animationDuration: props?.animationDuration ?? kThemeChangeDuration,
      clipBehavior: props?.clipBehavior ?? Clip.none,
      autofocus: props?.autofocus ?? false,
      enableFeedback: props?.enableFeedback ?? true,
      child: child,
    );

    return _widget;
  }

  static Map? toJson(Widget? widget, String widgetName,
      BuildContext? buildContext) {
    var button = widget as RawMaterialButton?;
    if (button == null) return null;
    return {
      'widget': widgetName,
      'child': DynamicWidgetBuilder.transformMap(button.child, buildContext),
      'xVar': {
        'textStyle': DynamicWidgetUtils.transform(button.textStyle),
        'fillColor': DynamicWidgetUtils.transform(button.fillColor),
        'focusColor': DynamicWidgetUtils.transform(button.focusColor),
        'hoverColor': DynamicWidgetUtils.transform(button.hoverColor),
        'highlightColor': DynamicWidgetUtils.transform(button.highlightColor),
        'splashColor': DynamicWidgetUtils.transform(button.splashColor),
        'elevation': button.elevation,
        'focusElevation': button.focusElevation,
        'hoverElevation': button.hoverElevation,
        'highlightElevation': button.highlightElevation,
        'disabledElevation': button.disabledElevation,
        'padding': DynamicWidgetUtils.transform(button.padding as EdgeInsets?),
        'constraints': DynamicWidgetUtils.transform(button.constraints),
        'shape': DynamicWidgetUtils.transform(
            button.shape as RoundedRectangleBorder?),
        'animationDuration':
        DynamicWidgetUtils.transform(button.animationDuration),
        'clipBehavior': DynamicWidgetUtils.transform(button.clipBehavior),
        'autofocus': button.autofocus,
        'enableFeedback': button.enableFeedback,
      },
      'xKey': button.key.toString()
    };
  }
}

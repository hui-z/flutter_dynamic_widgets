import 'package:flutter/material.dart';

import 'basic/handler.dart';
import 'basic/utils.dart';
import 'basic/widget.dart';
import 'config/event_name.dart';
import 'config/widget_config.dart';

class IconButtonHandler extends DynamicBasicWidgetHandler {
  @override
  String get widgetName => 'IconButton';

  @override
  Type get widgetType => IconButton;

  @override
  Widget build(DynamicWidgetConfig? config,
      {Key? key,
        required BuildContext buildContext,
        Function(String value)? event}) {
    return _Builder(config, event, key: key);
  }

  @override
  Map? transformJson(Widget? widget, BuildContext? buildContext) {
    var realWidget = widget as IconButton?;
    if (realWidget == null) return null;
    return IconButtonConfig.toJson(realWidget, widgetName, buildContext);
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
  IconButtonConfig? props;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.config?.xVar != null) {
      props = IconButtonConfig.fromJson(widget.config?.xVar ?? {});
    }
    var eventName = widget.config?.eventNames?.firstWhere(
            (element) => element.contains(EventName.onTap), orElse: () => '');

    var onPressed = eventName != null && eventName.isNotEmpty
        ? () {
      if (widget.event != null) {
        widget.event!(eventName);
      }
    }
        : null;

    return IconButton(
      key: widget.config?.xKey != null ? Key(widget.config!.xKey!) : null,
      iconSize: props?.iconSize ?? 24.0,
      padding: props?.padding ?? EdgeInsets.all(8.0),
      alignment: props?.alignment ?? Alignment.center,
      splashRadius: props?.splashRadius,
      color: props?.color,
      focusColor: props?.focusColor,
      hoverColor: props?.hoverColor,
      highlightColor: props?.highlightColor,
      splashColor: props?.splashColor,
      onPressed: onPressed,
      autofocus: props?.autofocus ?? false,
      tooltip: props?.tooltip,
      enableFeedback: props?.enableFeedback ?? true,
      constraints: props?.constraints,
      icon: DynamicWidgetBuilder.buildWidget(
          DynamicWidgetConfig.fromJson(props?.icon ?? {}), context: context,
          event: widget.event) ?? SizedBox(),
    );
  }
}

class IconButtonConfig {
  late double? iconSize;

  //late VisualDensity? visualDensity;
  late EdgeInsetsGeometry? padding;
  late AlignmentGeometry? alignment;
  late double? splashRadius;
  late Color? color;
  late Color? focusColor;
  late Color? hoverColor;
  late Color? highlightColor;
  late Color? splashColor;

  //late VoidCallback? onPressed;
  late MouseCursor? mouseCursor;

  //late FocusNode? focusNode;
  late bool? autofocus;
  late String? tooltip;
  late bool? enableFeedback;
  late BoxConstraints? constraints;
  late Map? icon;

  IconButtonConfig.fromJson(Map<dynamic, dynamic> json) {
    iconSize = json['iconSize'];
    padding = DynamicWidgetUtils.adapt<EdgeInsets>(json['padding']);
    alignment = DynamicWidgetUtils.adapt<Alignment>(json['alignment']);
    splashRadius = json['splashRadius']?.toDouble();
    color = DynamicWidgetUtils.adapt<Color>(json['color']);
    focusColor = DynamicWidgetUtils.adapt<Color>(json['focusColor']);
    hoverColor = DynamicWidgetUtils.adapt<Color>(json['hoverColor']);
    highlightColor = DynamicWidgetUtils.adapt<Color>(json['highlightColor']);
    splashColor = DynamicWidgetUtils.adapt<Color>(json['splashColor']);
    mouseCursor = DynamicWidgetUtils.adapt<MouseCursor>(json['mouseCursor']);
    autofocus = json['autofocus'];
    tooltip = json['tooltip'];
    enableFeedback = json['enableFeedback'];
    constraints = DynamicWidgetUtils.adapt<BoxConstraints>(json['constraints']);
  }

  static Map? toJson(IconButton widget, String widgetName,
      BuildContext? buildContext) {
    return {
      'widget': widgetName,
      'icon': DynamicWidgetBuilder.transformMap(widget.icon, buildContext),
      'xVar': {
        'iconSize': widget.iconSize,
        'padding': DynamicWidgetUtils.transform(
            widget.padding as EdgeInsets),
        'alignment': DynamicWidgetUtils.transform(
            widget.alignment as Alignment),
        'splashRadius': widget.splashRadius,
        'color': DynamicWidgetUtils.transform(widget.color),
        'focusColor': DynamicWidgetUtils.transform(widget.focusColor),
        'hoverColor': DynamicWidgetUtils.transform(widget.hoverColor),
        'highlightColor': DynamicWidgetUtils.transform(widget.highlightColor),
        'splashColor': DynamicWidgetUtils.transform(widget.splashColor),
        'mouseCursor': DynamicWidgetUtils.transform(widget.mouseCursor),
        'autofocus': widget.autofocus,
        'tooltip': widget.tooltip,
        'enableFeedback': widget.enableFeedback,
        'constraints': DynamicWidgetUtils.transform(widget.constraints),
      },
      'xKey': widget.key.toString()
    };
  }
}

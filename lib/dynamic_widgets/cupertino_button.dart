import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'basic/handler.dart';
import 'basic/utils.dart';
import 'basic/widget.dart';
import 'config/event_name.dart';
import 'config/widget_config.dart';

class CupertinoButtonHandler extends DynamicBasicWidgetHandler {
  @override
  String get widgetName => 'CupertinoButton';

  @override
  Type get widgetType => CupertinoButton;

  @override
  Widget build(DynamicWidgetConfig? config,
      {Key? key,
      required BuildContext buildContext,
      Function(EventInfo value)? event}) {
    return _Builder(config, event, key: key);
  }

  @override
  Map? transformJson(Widget? widget, BuildContext? buildContext) {
    var realWidget = widget as CupertinoButton?;
    if (realWidget == null) return null;
    return CupertinoButtonConfig.toJson(realWidget, widgetName, buildContext);
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
  CupertinoButtonConfig? props;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.config?.xVar != null) {
      props = CupertinoButtonConfig.fromJson(widget.config?.xVar ?? {});
    }
    var eventInfo = widget.config?.events.firstWhere(
        (element) => element.type == EventType.onTap,
        orElse: () => EventInfo(type: '', action: ''));
    var onPressed = eventInfo?.type != null && eventInfo?.type != ''
        ? () {
            if (widget.event != null) {
              widget.event!(eventInfo!);
            }
          }
        : null;

    return CupertinoButton(
      key: widget.config?.xKey != null ? Key(widget.config!.xKey!) : null,
      padding: props?.padding ?? EdgeInsets.all(8.0),
      color: props?.color,
      disabledColor:
          props?.disabledColor ?? CupertinoColors.quaternarySystemFill,
      minSize: props?.minSize ?? kMinInteractiveDimensionCupertino,
      pressedOpacity: props?.pressedOpacity ?? 0.4,
      borderRadius:
          props?.borderRadius ?? const BorderRadius.all(Radius.circular(8.0)),
      alignment: props?.alignment ?? Alignment.center,
      onPressed: onPressed,
      child: DynamicWidgetBuilder.buildWidget(widget.config?.child,
              context: context, event: widget.event) ??
          SizedBox(),
    );
  }
}

class CupertinoButtonConfig {
  late EdgeInsetsGeometry? padding;
  late Color? color;
  late Color? disabledColor;
  late double? minSize;
  late double? pressedOpacity;
  late BorderRadius? borderRadius;
  late AlignmentGeometry? alignment;

  //late VoidCallback? onPressed;
  //late Widget? child;

  CupertinoButtonConfig.fromJson(Map<dynamic, dynamic> json) {
    padding = DynamicWidgetUtils.adapt<EdgeInsets>(json['padding']);
    color = DynamicWidgetUtils.adapt<Color>(json['color']);
    disabledColor = DynamicWidgetUtils.adapt<Color>(json['disabledColor']);
    minSize = json['minSize'].toDouble();
    pressedOpacity = json['pressedOpacity'].toDouble();
    borderRadius = DynamicWidgetUtils.adapt<BorderRadius>(json['borderRadius']);
    alignment = DynamicWidgetUtils.adapt<Alignment>(json['alignment']);
  }

  static Map? toJson(
      CupertinoButton widget, String widgetName, BuildContext? buildContext) {
    return {
      'widget': widgetName,
      'child': DynamicWidgetBuilder.transformMap(widget.child, buildContext),
      'xVar': {
        'padding': DynamicWidgetUtils.transform(widget.padding as EdgeInsets),
        'color': DynamicWidgetUtils.transform(widget.color),
        'disabledColor': DynamicWidgetUtils.transform(widget.disabledColor),
        'minSize': widget.minSize,
        'pressedOpacity': widget.pressedOpacity,
        'borderRadius': DynamicWidgetUtils.transform(widget.borderRadius),
        'alignment':
            DynamicWidgetUtils.transform(widget.alignment as Alignment),
      },
      'xKey': widget.key.toString()
    };
  }
}

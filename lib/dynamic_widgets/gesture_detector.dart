import 'package:flutter/material.dart';

import 'basic/handler.dart';
import 'basic/widget.dart';
import 'config/event_name.dart';
import 'config/widget_config.dart';

class GestureDetectorHandler extends DynamicBasicWidgetHandler {
  @override
  String get widgetName => 'GestureDetector';

  @override
  Widget build(DynamicWidgetConfig? config,
      {Key? key,
      required BuildContext buildContext,
      Function(String value)? event}) {
    return _Builder(config, event, key: key);
  }

  @override
  Map? transformJson(Widget? widget, BuildContext? buildContext) {
    var gestureDetector = widget as GestureDetector?;
    if (gestureDetector == null) return null;
    return {
      'widget': widgetName,
      'child': DynamicWidgetBuilder.transformMap(
          gestureDetector.child, buildContext),
      'xKey': gestureDetector.key.toString()
    };
  }

  @override
  Type get widgetType => GestureDetector;
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
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget? _child = DynamicWidgetBuilder.buildWidget(widget.config?.child,
        context: context, event: widget.event);

    var onTap = widget.config?.eventNames?.contains(EventName.onTap) == true
        ? () {
            if (widget.event != null) {
              widget.event!(widget.config?.eventNames?.firstWhere(
                      (element) => element.contains(EventName.onTap)) ??
                  '');
            }
          }
        : null;
    var onLongPress =
        widget.config?.eventNames?.contains(EventName.onLongPress) == true
            ? () {
                if (widget.event != null) {
                  widget.event!(widget.config?.eventNames?.firstWhere(
                          (element) =>
                              element.contains(EventName.onLongPress)) ??
                      '');
                }
              }
            : null;
    var onDoubleTap =
        widget.config?.eventNames?.contains(EventName.onDoubleTap) == true
            ? () {
                if (widget.event != null) {
                  widget.event!(widget.config?.eventNames?.firstWhere(
                          (element) =>
                              element.contains(EventName.onDoubleTap)) ??
                      '');
                }
              }
            : null;
    return GestureDetector(
      key: widget.config?.xKey != null ? Key(widget.config!.xKey!) : null,
      onTap: onTap,
      onDoubleTap: onDoubleTap,
      onLongPress: onLongPress,
      child: _child ?? SizedBox(),
    );
  }
}

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
      Function(EventInfo value)? event}) {
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
    Widget? _child = DynamicWidgetBuilder.buildWidget(widget.config?.child,
        context: context, event: widget.event);

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
    return GestureDetector(
      key: widget.config?.xKey != null ? Key(widget.config!.xKey!) : null,
      onTap: onTap,
      onDoubleTap: onDoubleTap,
      onLongPress: onLongPress,
      child: _child ?? SizedBox(),
    );
  }
}

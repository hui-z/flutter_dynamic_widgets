import 'package:flutter/material.dart';

import 'basic/handler.dart';
import 'basic/utils.dart';
import 'basic/widget.dart';
import 'config/event_name.dart';
import 'config/widget_config.dart';

class FlowHandler extends DynamicBasicWidgetHandler {
  @override
  String get widgetName => 'Flow';

  @override
  Type get widgetType => Flow;

  @override
  Widget build(DynamicWidgetConfig? config,
      {Key? key,
      required BuildContext buildContext,
      Function(EventInfo value)? event}) {
    return _Builder(config, event, key: key);
  }

  @override
  Map? transformJson(Widget? widget, BuildContext? buildContext) {
    var realWidget = widget as Flow?;
    if (realWidget == null) return null;
    return {
      'widget': widgetName,
      'children':
          DynamicWidgetBuilder.transformList(realWidget.children, buildContext),
      'xVar': {
        'delegate':
            DyFlowDelegate.toJson(realWidget.delegate as DyFlowDelegate),
        'clipBehavior': DynamicWidgetUtils.transform(realWidget.clipBehavior),
      },
      'xKey': realWidget.key.toString()
    };
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
  FlowConfig? props;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.config?.xVar != null) {
      props = FlowConfig.fromJson(widget.config?.xVar ?? {});
    }
    return Flow(
      key: widget.config?.xKey != null ? Key(widget.config!.xKey!) : null,
      delegate: props?.delegate ?? DyFlowDelegate.fromJson(null),
      clipBehavior: props?.clipBehavior ?? Clip.hardEdge,
      children: DynamicWidgetBuilder.buildWidgets(widget.config?.children,
          context: context, event: widget.event),
    );
  }
}

class FlowConfig {
  late FlowDelegate? delegate;
  late Clip? clipBehavior;

  FlowConfig.fromJson(Map<dynamic, dynamic> json) {
    delegate = DyFlowDelegate.fromJson(json['delegate']);
    clipBehavior = DynamicWidgetUtils.adapt<Clip>(json['clipBehavior']);
  }
}

class DyFlowDelegate extends FlowDelegate {
  double boxSize = 80; //盒子大小
  double padding = 5; //间距
  double offsetX = 5; //x坐标
  double offsetY = 5; //y坐标

  DyFlowDelegate.fromJson(Map<dynamic, dynamic>? json) {
    if (json == null) return;
    boxSize = json['boxSize']?.toDouble() ?? 80;
    padding = json['padding']?.toDouble() ?? 5;
    offsetX = json['offsetX']?.toDouble() ?? 5;
    offsetY = json['offsetY']?.toDouble() ?? 5;
  }

  static Map<dynamic, dynamic> toJson(DyFlowDelegate? delegate) {
    var dg = delegate;
    if (dg == null) dg = DyFlowDelegate.fromJson(null);
    return {
      'boxSize': dg.boxSize,
      'padding': dg.padding,
      'offsetX': dg.offsetX,
      'offsetY': dg.offsetY
    };
  }

  @override
  void paintChildren(FlowPaintingContext context) {
    /*屏幕宽度*/
    var screenW = context.size.width;

    for (int i = 0; i < context.childCount; i++) {
      /*如果当前x左边加上子控件宽度小于屏幕宽度  则继续绘制  否则换行*/
      if (offsetX + boxSize < screenW) {
        /*绘制子控件*/
        context.paintChild(i,
            transform: Matrix4.translationValues(offsetX, offsetY, 0));
        /*更改x坐标*/
        offsetX = offsetX + boxSize + padding;
      } else {
        /*将x坐标重置为margin*/
        offsetX = padding;
        /*计算y坐标的值*/
        offsetY = offsetY + boxSize + padding;
        /*绘制子控件*/
        context.paintChild(i,
            transform: Matrix4.translationValues(offsetX, offsetY, 0));
      }
    }
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return true;
  }
}

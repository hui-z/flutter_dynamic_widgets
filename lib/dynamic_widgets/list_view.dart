import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';

import 'basic/handler.dart';
import 'basic/utils.dart';
import 'basic/widget.dart';
import 'config/widget_config.dart';

class ListViewHandler extends DynamicBasicWidgetHandler {

  @override
  String get widgetName => 'ListView';

  @override
  Widget build(DynamicWidgetConfig? config,
      {Key? key, required BuildContext buildContext, Function(String value)? event}) {
    return _Builder(config, event, key: key);
  }

  @override
  Map? transformJson(Widget? widget, BuildContext? buildContext) {
    var listView = widget as ListView?;
    if (listView == null) return null;
    return {
      'widget': widgetName,
      'xVar': {
      },
      'xKey': listView.key.toString()
    };
  }

  @override
  Type get widgetType => ListView;
}

class _Builder extends DynamicBaseWidget {
  final DynamicWidgetConfig? config;
  final Function(String value)? event;

  _Builder(this.config, this.event, {Key? key}) : super(config, event, key: key);

  @override
  _BuilderState createState() => _BuilderState();
}

class _BuilderState extends State<_Builder> {
  ListViewConfig? props;

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.config?.xVar != null) {
      props = ListViewConfig.fromJson(widget.config?.xVar ?? {});
    }
    List<Widget> _children = DynamicWidgetBuilder.buildWidgets(widget.config?.children, context: context, event: widget.event);

    return ListView(
      key: widget.config?.xKey != null ? Key(widget.config!.xKey!) : null,
      children: _children,
      scrollDirection: props?.scrollDirection ?? Axis.vertical,
      reverse: props?.reverse ?? false,
      primary: props?.primary,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: props?.shrinkWrap ?? false,
      padding: props?.padding,
      itemExtent: props?.itemExtent,
      addAutomaticKeepAlives: props?.addAutomaticKeepAlives ?? true,
      addRepaintBoundaries: props?.addRepaintBoundaries ?? true,
      addSemanticIndexes: props?.addSemanticIndexes ?? true,
      cacheExtent: props?.cacheExtent,
      dragStartBehavior: props?.dragStartBehavior ?? DragStartBehavior.start,
      keyboardDismissBehavior: props?.keyboardDismissBehavior ?? ScrollViewKeyboardDismissBehavior.manual,
      restorationId: props?.restorationId,
      clipBehavior: props?.clipBehavior ?? Clip.none,
    );
  }

}

class ListViewConfig {
  late Axis? scrollDirection;
  late bool? reverse ;
  late bool? primary;
  late bool? shrinkWrap;
  late EdgeInsetsGeometry? padding;
  late double? itemExtent;
  late bool? addAutomaticKeepAlives;
  late bool? addRepaintBoundaries;
  late bool? addSemanticIndexes;
  late double? cacheExtent;
  late DragStartBehavior? dragStartBehavior;
  late ScrollViewKeyboardDismissBehavior? keyboardDismissBehavior;
  late String? restorationId;
  late Clip? clipBehavior ;

  ListViewConfig.fromJson(Map<dynamic, dynamic> json) {
    scrollDirection = DynamicWidgetUtils.adapt<Axis>(json['scrollDirection']);
    reverse = json['reverse'];
    primary = json['primary'];
    shrinkWrap = json['shrinkWrap'];
    padding = DynamicWidgetUtils.adapt<EdgeInsets>(json['padding']);
    itemExtent = json['itemExtent'];
    addAutomaticKeepAlives = json['addAutomaticKeepAlives'];
    addRepaintBoundaries = json['addRepaintBoundaries'];
    addSemanticIndexes = json['addSemanticIndexes'];
    cacheExtent = json['cacheExtent'];
    dragStartBehavior = DynamicWidgetUtils.adapt<DragStartBehavior>(json['dragStartBehavior']);
    keyboardDismissBehavior = DynamicWidgetUtils.adapt<ScrollViewKeyboardDismissBehavior>(json['keyboardDismissBehavior']);
    restorationId = json['restorationId'];
    clipBehavior = DynamicWidgetUtils.adapt<Clip>(json['clipBehavior']);
  }

}
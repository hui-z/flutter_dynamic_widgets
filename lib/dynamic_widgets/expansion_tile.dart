import 'package:flutter/material.dart';
import 'package:flutter_dynamic_widgets/custom_widget/expansion_tile.dart';

import 'basic/handler.dart';
import 'basic/utils.dart';
import 'basic/widget.dart';
import 'config/event_name.dart';
import 'config/widget_config.dart';

class CustomExpansionTileHandler extends DynamicBasicWidgetHandler {
  @override
  String get widgetName => 'CustomExpansionTile';

  @override
  Widget build(DynamicWidgetConfig? config,
      {Key? key,
      required BuildContext buildContext,
      Function(EventInfo value)? event}) {
    return _Builder(config, event, key: key);
  }

  @override
  Map? transformJson(Widget? widget, BuildContext? buildContext) {
    var expand = widget as CustomExpansionTile?;
    if (expand == null) return null;
    return CustomExpansionTileConfig.toJson(expand, widgetName, buildContext);
  }

  @override
  Type get widgetType => CustomExpansionTile;
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
  CustomExpansionTileConfig? props;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.config?.xVar != null) {
      props = CustomExpansionTileConfig.fromJson(
          widget.config?.xVar ?? {}, context);
    }

    return CustomExpansionTile(
      key: widget.config?.xKey != null ? Key(widget.config!.xKey!) : null,
      leading: props?.leading,
      title: props?.title ?? Text('默认'),
      subtitle: props?.subtitle,
      backgroundColor: props?.backgroundColor,
      onExpansionChanged: (expanded) {
        var eventInfo = widget.config?.events.firstWhere(
            (element) => element.type == EventType.onExpansionChanged,
            orElse: () => EventInfo(type: '', action: ''));
        if (eventInfo?.type != null &&
            eventInfo?.type != '' &&
            widget.event != null) {
          eventInfo?.operateData = 'expanded=$expanded';
          widget.event!(eventInfo!);
        }
      },
      children: DynamicWidgetBuilder.buildWidgets(widget.config?.children,
          context: context),
      trailing: props?.trailing,
      initiallyExpanded: props?.initiallyExpanded ?? false,
      topMargin: props?.topMargin,
    );
  }
}

class CustomExpansionTileConfig {
  late Widget? leading;
  late Widget? title;
  late Widget? subtitle;
  late Color? backgroundColor;
  late Widget? trailing;
  late bool? initiallyExpanded;
  late double? topMargin;

  CustomExpansionTileConfig.fromJson(
      Map<dynamic, dynamic> json, BuildContext context) {
    leading = json['leading'] != null
        ? DynamicWidgetBuilder.buildWidget(
            DynamicWidgetConfig.fromJson(json['leading']),
            context: context)
        : null;
    title = json['title'] != null
        ? DynamicWidgetBuilder.buildWidget(
            DynamicWidgetConfig.fromJson(json['title']),
            context: context)
        : null;
    initiallyExpanded = json['initiallyExpanded'];
    topMargin = json['topMargin'];
    subtitle = json['subtitle'] != null
        ? DynamicWidgetBuilder.buildWidget(
            DynamicWidgetConfig.fromJson(json['subtitle']),
            context: context)
        : null;
    trailing = json['trailing'] != null
        ? DynamicWidgetBuilder.buildWidget(
            DynamicWidgetConfig.fromJson(json['trailing']),
            context: context)
        : null;
    backgroundColor = DynamicWidgetUtils.adapt<Color>(json['backgroundColor']);
  }

  static Map? toJson(CustomExpansionTile expansionTile, String widgetName,
      BuildContext? buildContext) {
    return {
      'widget': widgetName,
      'children': DynamicWidgetBuilder.transformList(
          expansionTile.children, buildContext),
      'xVar': {
        'leading': DynamicWidgetBuilder.transformMap(
            expansionTile.leading, buildContext),
        'title': DynamicWidgetBuilder.transformMap(
            expansionTile.title, buildContext),
        'subtitle': DynamicWidgetBuilder.transformMap(
            expansionTile.subtitle, buildContext),
        'trailing': DynamicWidgetBuilder.transformMap(
            expansionTile.trailing, buildContext),
        'backgroundColor':
            DynamicWidgetUtils.transform(expansionTile.backgroundColor),
        'initiallyExpanded': expansionTile.initiallyExpanded,
        'topMargin': expansionTile.topMargin,
      },
      'xKey': expansionTile.key.toString()
    };
  }
}

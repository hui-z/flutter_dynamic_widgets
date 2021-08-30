import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dynamic_widgets/custom_widget/check_list.dart';

import 'basic/handler.dart';
import 'basic/utils.dart';
import 'basic/widget.dart';
import 'config/event_name.dart';
import 'config/widget_config.dart';

class CheckListItemHandler extends DynamicBasicWidgetHandler {
  @override
  String get widgetName => 'CheckListItem';

  @override
  Type get widgetType => CheckListItem;

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
  late CheckType? checkType;
  late CheckListData? item;
  late List<CheckListData>? checkedData;
  late CrossAxisAlignment? crossAxisAlignment;
  late bool? showIcon;
  late String? icon;
  late Color? activeColor;

  Config.fromJson(Map<dynamic, dynamic> json, BuildContext? context) {
    checkType =
    json['checkType'] == 'multiple' ? CheckType.multiple : CheckType.single;
    item = CheckListData.adapter(json['item'], context);
    checkedData = [];
    json['checkedData']?.forEach((v) {
      checkedData?.add(CheckListData.adapter(v, context)!);
    });
    crossAxisAlignment = DynamicWidgetUtils.adapt<CrossAxisAlignment>(
        json['crossAxisAlignment']);
    showIcon = json['showIcon'];
    icon = json['icon'];
    activeColor = json['activeColor'];
  }

  static Widget toWidget(BuildContext context, _Builder widget) {
    Config? props;
    if (widget.config?.xVar != null) {
      props = Config.fromJson(widget.config?.xVar ?? {}, context);
    }
    var onCheck = (bool? isChecked, CheckListData? item) {
      var eventInfo = widget.config?.events.firstWhere(
              (element) => element.type == EventType.onCheck,
          orElse: () => EventInfo(type: '', action: ''));
      if (eventInfo?.type != null &&
          eventInfo?.type != '' &&
          widget.event != null) {
        eventInfo?.operateData =
            '&item=${json.encode(item?.transform(context)).toString()}' +
                '&isChecked=${isChecked ?? false}';
        widget.event!(eventInfo!);
      }
    };

    return CheckListItem(
      props?.checkType ?? CheckType.single,
      props?.item,
      onCheck,
      props?.checkedData ?? [],
      crossAxisAlignment:
      props?.crossAxisAlignment ?? CrossAxisAlignment.center,
      showIcon: props?.showIcon ?? false,
      icon: props?.icon,
      onIconPressed: (item) {
        var eventInfo = widget.config?.events.firstWhere(
                (element) => element.type == EventType.onTap,
            orElse: () => EventInfo(type: '', action: ''));
        if (eventInfo?.type != null &&
            eventInfo?.type != '' &&
            widget.event != null) {
          eventInfo?.operateData =
              json.encode(item.transform(context)).toString();
          widget.event!(eventInfo!);
        }
      },
      activeColor: props?.activeColor,
    );
  }

  static Map? toJson(Widget? widget, String widgetName,
      BuildContext? buildContext) {
    var checkListItem = widget as CheckListItem?;
    if (checkListItem == null) return null;
    return {
      'widget': widgetName,
      'xVar': {
        'checkType': checkListItem.checkType == CheckType.multiple
            ? 'multiple'
            : 'single',
        'item': checkListItem.item?.transform(buildContext),
        'checkedData':
        checkListItem.checkedData.map((e) => e.transform(buildContext))
            .toList(),
        'crossAxisAlignment':
        DynamicWidgetUtils.transform(checkListItem.crossAxisAlignment),
        'showIcon': checkListItem.showIcon,
        'activeColor': DynamicWidgetUtils.transform(checkListItem.activeColor),
        'icon': checkListItem.icon,
      },
      'xKey': checkListItem.key.toString()
    };
  }
}

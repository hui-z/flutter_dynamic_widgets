import 'event_name.dart';

class DynamicWidgetConfig {
  late String widget;
  late DynamicWidgetConfig? child;
  late List<DynamicWidgetConfig>? children;
  late Map? xVar;
  late String? xKey;
  late List<EventInfo> events;

  DynamicWidgetConfig(
      {required this.widget,
      this.child,
      this.xVar,
      this.children,
      this.xKey,
      required this.events});

  DynamicWidgetConfig.fromJson(Map<dynamic, dynamic> json) {
    widget = json['widget'];
    child = null;
    if (json['child'] != null) {
      child = DynamicWidgetConfig.fromJson(json['child']);
    }
    children = [];
    if (json['children'] != null) {
      json['children'].forEach((v) {
        children?.add(DynamicWidgetConfig.fromJson(v));
      });
    }
    events = [];
    if (json['events'] != null) {
      json['events'].forEach((v) {
        events.add(EventInfo.fromJson(v));
      });
    }
    xVar = json['xVar'];
    xKey = json['xKey'];
  }
}

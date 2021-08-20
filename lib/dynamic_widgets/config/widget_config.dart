class DynamicWidgetConfig {
	late String widget;
	late DynamicWidgetConfig? child;
  late List<DynamicWidgetConfig>? children;
  late Map? xVar;
  late String? xKey;
  late String? eventName;

	DynamicWidgetConfig({required this.widget, this.child, this.xVar, this.children, this.xKey, this.eventName});

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
    eventName = json['eventName'];
    xVar = json['xVar'];
    xKey = json['xKey'];
	}
}
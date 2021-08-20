class DynamicWidgetConfig {
	late String widget;
	late DynamicWidgetConfig? child;
  late List<DynamicWidgetConfig>? children;
  late Map? xVar;
  late String? xKey;
  late List<String>? eventNames;

	DynamicWidgetConfig({required this.widget, this.child, this.xVar, this.children, this.xKey, this.eventNames});

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
    eventNames = json['eventName']?.cast<String>();
    xVar = json['xVar'];
    xKey = json['xKey'];
	}
}
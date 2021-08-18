class DynamicWidgetConfig {
	late String widget;
	late DynamicWidgetConfig? child;
  late List<DynamicWidgetConfig>? children;
  late Map? xVar;
  late String? xKey;

	DynamicWidgetConfig({required this.widget, this.child, this.xVar, this.children, this.xKey});

	DynamicWidgetConfig.fromJson(Map<dynamic, dynamic> json) {
		widget = json['widget'];
		if (json['child'] != null) {
		  child = DynamicWidgetConfig.fromJson(json['child']);
    }
    children = [];
    if (json['children'] != null) {
      json['children'].forEach((v) {
        children?.add(DynamicWidgetConfig.fromJson(v));
      });
    }
    xVar = json['xVar'];
    xKey = json['xKey'];
	}
}
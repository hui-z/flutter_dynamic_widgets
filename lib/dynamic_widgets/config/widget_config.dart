class DynamicWidgetConfig {
	late String widget;
	late DynamicWidgetConfig? propsMap;
  late List<DynamicWidgetConfig>? propsList;
  late Map? xVar;
  late String? xKey;

	DynamicWidgetConfig({required this.widget, this.propsMap, this.xVar, this.propsList, this.xKey});

	DynamicWidgetConfig.fromJson(Map<dynamic, dynamic> json) {
		widget = json['widget'];
		if (json['propsMap'] != null) {
		  propsMap = DynamicWidgetConfig.fromJson(json['propsMap']);
    }
    if (json['propsList'] != null) {
      propsList = [];
      json['propsList'].forEach((v) {
        propsList?.add(DynamicWidgetConfig.fromJson(v));
      });
    }
    xVar = json['xVar'];
    xKey = json['xKey'];
	}
}
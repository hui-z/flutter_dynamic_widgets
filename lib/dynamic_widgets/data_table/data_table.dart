import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../basic/handler.dart';
import '../basic/utils.dart';
import '../basic/widget.dart';
import '../config/widget_config.dart';

/// Row handler
class TableHandler extends DynamicBasicWidgetHandler {

  @override
  String get widgetName => 'DataTable';

  @override
  Widget build(DynamicWidgetConfig? config,
      {Key? key, required BuildContext buildContext, Function(String value)? event}) {
    return _Builder(config, event, key: key);
  }

  @override
  Map? transformJson(Widget? widget, BuildContext? buildContext) {
    var row = widget as Table?;
    if (row == null) return null;
    return {
      'widget': widgetName,
      'children': [],
      'xVar': {},
      'xKey': row.key.toString()
    };
  }

  @override
  Type get widgetType => Table;
}

class _Builder extends DynamicBaseWidget {
  final DynamicWidgetConfig? config;
  final Function(String value)? event;

  _Builder(this.config, this.event, {Key? key}) : super(config, event, key: key);

  @override
  _BuilderState createState() => _BuilderState();
}

class _BuilderState extends State<_Builder> {
  DataTableConfig? props;

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.config?.xVar != null) {
      props = DataTableConfig.fromJson(widget.config?.xVar ?? {});
    }
    return DataTable(
      key: widget.config?.xKey != null ? Key(widget.config!.xKey!) : null,
      rows: [],
      columns: [],
    );
  }

}

/// The props of Row config
class DataTableConfig {
  late double? dataRowHeight;
  late TextStyle? dataTextStyle;
  late double? headingRowHeight;
  late TextStyle? headingTextStyle;
  late double? horizontalMargin;
  late double? columnSpacing;
  late double? dividerThickness;
  late bool? showBottomBorder;
  late List<Widget>? rows;
  late List<DataColumn>? columns;

  DataTableConfig(
      {this.dataRowHeight,
        this.dataTextStyle,
        this.headingRowHeight,
        this.headingTextStyle,
        this.horizontalMargin,
        this.columnSpacing,
        this.dividerThickness,
        this.showBottomBorder,
        this.rows,
        this.columns});

  DataTableConfig.fromJson(Map<dynamic, dynamic> json) {
      this.dataRowHeight = json['dataRowHeight'];
      this.dataTextStyle = DynamicWidgetUtils.textStyleAdapter(json['dataTextStyle']);
      this.headingRowHeight = json['dataTextStyle'];
      this.headingTextStyle = DynamicWidgetUtils.textStyleAdapter(json['headingTextStyle']);
      this.horizontalMargin = json['horizontalMargin'];
      this.dividerThickness = json['dividerThickness'];
      this.columnSpacing = json['columnSpacing'];
      this.showBottomBorder = json['showBottomBorder'];
  }

}
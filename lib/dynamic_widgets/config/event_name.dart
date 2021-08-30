class EventType {
  static const String onTap = 'onTap';
  static const String onLongPress = 'onLongPress';
  static const String onDoubleTap = 'onDoubleTap';
  static const String onCheck = 'onCheck';
  static const String onTextChanged = 'onTextChanged';
  static const String onExpansionChanged = 'onExpansionChanged';
  static const String onDeleted = 'onDeleted';
}

class EventAction {
  static const String push = 'push';
  static const String request = 'request';
  static const String openUrl = 'open_url';
}

class EventInfo {
  late final String type;
  late final String action;
  late final String? page;
  late final String? method;
  late final String? path;
  late final String? url;
  late final Map? arguments;
  late final Map? queryParameters;
  late final Map? bodyData;
  late final String? operateData;

  EventInfo(
      {required this.type,
      required this.action,
      this.page,
      this.method,
      this.path,
      this.url,
      this.arguments,
      this.queryParameters,
      this.bodyData,
      this.operateData});

  EventInfo.fromJson(Map<dynamic, dynamic> json) {
    type = json['type'];
    action = json['action'];
    page = json['page'];
    method = json['method'];
    path = json['path'];
    url = json['url'];
    arguments = json['arguments'];
    queryParameters = json['queryParameters'];
    bodyData = json['bodyData'];
    operateData = json['operateData'];
  }
}

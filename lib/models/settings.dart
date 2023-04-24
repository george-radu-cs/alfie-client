class Settings {
  final int? id;
  final String languageCode;
  final String themeMode;
  final String themeColor;
  final bool showOCRDialog;

  Settings({
    this.id,
    required this.languageCode,
    required this.themeMode,
    required this.themeColor,
    required this.showOCRDialog,
  });

  factory Settings.fromMap(Map<String, dynamic> json) => Settings(
        id: json['id'],
        languageCode: json['languageCode'],
        themeMode: json['themeMode'],
        themeColor: json['themeColor'],
        showOCRDialog: json['showOCRDialog'] == 1,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'languageCode': languageCode,
        'themeMode': themeMode,
        'themeColor': themeColor,
        'showOCRDialog': showOCRDialog ? 1 : 0,
      };

  Settings copyWith({
    int? id,
    String? languageCode,
    String? themeMode,
    String? themeColor,
    bool? showOCRDialog,
  }) {
    return Settings(
      id: id ?? this.id,
      languageCode: languageCode ?? this.languageCode,
      themeMode: themeMode ?? this.themeMode,
      themeColor: themeColor ?? this.themeColor,
      showOCRDialog: showOCRDialog ?? this.showOCRDialog,
    );
  }

  @override
  String toString() {
    return 'Settings(id: $id, languageCode: $languageCode, themeMode: $themeMode, themeColor: $themeColor, showOCRDialog: $showOCRDialog)';
  }
}

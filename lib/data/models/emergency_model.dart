class EmergencyModel {
  final String id;
  final String titleEn;
  final String titleUr;
  final String icon;
  final List<StepModel> steps;

  EmergencyModel({
    required this.id,
    required this.titleEn,
    required this.titleUr,
    required this.icon,
    required this.steps,
  });

  factory EmergencyModel.fromJson(Map<String, dynamic> json) {
    var stepsJson = json['steps'] as List;
    List<StepModel> stepsList =
        stepsJson.map((step) => StepModel.fromJson(step)).toList();

    return EmergencyModel(
      id: json['id'],
      titleEn: json['title_en'],
      titleUr: json['title_ur'],
      icon: json['icon'],
      steps: stepsList,
    );
  }
}

class StepModel {
  final int step;
  final String en;
  final String ur;

  StepModel({
    required this.step,
    required this.en,
    required this.ur,
  });

  factory StepModel.fromJson(Map<String, dynamic> json) {
    return StepModel(
      step: json['step'],
      en: json['en'],
      ur: json['ur'],
    );
  }
}

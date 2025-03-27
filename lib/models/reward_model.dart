class RewardOption {
  final String title;
  final String description;
  final int exchangePoint; 

  RewardOption({
    required this.title,
    required this.description,
    required this.exchangePoint,
  });

  factory RewardOption.fromJson(Map<String, dynamic> json) {
    return RewardOption(
      title: json['title'],
      description: json['description'],
      exchangePoint: json['exchangePoint'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'exchangePoint': exchangePoint,
    };
  }
}

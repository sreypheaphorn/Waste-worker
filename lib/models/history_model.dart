class Pickup {
  final int pickupId;
  final DateTime date;
  final List<String> wasteTypes;
  final int estimateWeight;
  final String status;
  final String userId;
  final dynamic user; // អាចជា `null` ឬ object
  final DateTime createdAt;

  Pickup({
    required this.pickupId,
    required this.date,
    required this.wasteTypes,
    required this.estimateWeight,
    required this.status,
    required this.userId,
    required this.user,
    required this.createdAt,
  });

  factory Pickup.fromJson(Map<String, dynamic> json) {
    return Pickup(
      pickupId: json['pickupId'],
      date: DateTime.parse(json['date']),
      wasteTypes: List<String>.from(json['wasteTypes']),
      estimateWeight: json['estimateWeight'],
      status: json['status'],
      userId: json['userId'],
      user: json['user'], // `null` or user object
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pickupId': pickupId,
      'date': date.toIso8601String(),
      'wasteTypes': wasteTypes,
      'estimateWeight': estimateWeight,
      'status': status,
      'userId': userId,
      'user': user,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}

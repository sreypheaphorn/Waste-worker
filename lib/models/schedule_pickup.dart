class PickupRequest {
  DateTime pickupDate;
  String pickupTime;
  List<String> wasteTypes;
  bool isRecurring;
  String? estimatedWeight; // Optional, in case you decide to add this field

  PickupRequest({
    required this.pickupDate,
    required this.pickupTime,
    required this.wasteTypes,
    required this.isRecurring,
    this.estimatedWeight,
  });

  // Convert the PickupRequest to a map for the API request
  Map<String, dynamic> toJson() {
    return {
      'pickup_date': pickupDate.toIso8601String(),
      'pickup_time': pickupTime,
      'waste_types': wasteTypes,
      'is_recurring': isRecurring,
      'estimated_weight': estimatedWeight,
    };
  }
}

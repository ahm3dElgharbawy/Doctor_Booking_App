class Time {
    final int id;
    final int scheduleId;
    final String startTime;
    final String endTime;
    final int isAvailable;

    Time({
        required this.id,
        required this.scheduleId,
        required this.startTime,
        required this.endTime,
        required this.isAvailable,
    });

    factory Time.fromJson(Map<String, dynamic> json) => Time(
        id: json["id"],
        scheduleId: json["schedule_id"],
        startTime: json["start_time"],
        endTime: json["end_time"],
        isAvailable: json["is_available"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "schedule_id": scheduleId,
        "start_time": startTime,
        "end_time": endTime,
        "is_available": isAvailable,
    };
}

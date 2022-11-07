import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Task {
  int? id;
  String? title;
  String? note;
  int? isCompleted;
  String? date;
  String? startTime;
  String? endTime;
  int? color;
  int? remind;
  String? repeat;

  Task({
    this.id,
    this.title,
    this.note,
    this.isCompleted,
    this.date,
    this.startTime,
    this.endTime,
    this.color,
    this.remind,
    this.repeat,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'note': note,
      'isCompleted': isCompleted,
      'date': date,
      'startTime': startTime,
      'endTime': endTime,
      'color': color,
      'remind': remind,
      'repeat': repeat,
    };
  }

  Task.fromJson(Map<String, dynamic> json) {
    id = json['id'] != null ? json['id'] as int : null;
    title = json['title'] != null ? json['title'] as String : null;
    note = json['note'] != null ? json['note'] as String : null;
    isCompleted =
        json['isCompleted'] != null ? json['isCompleted'] as int : null;
    date = json['date'] != null ? json['date'] as String : null;
    startTime = json['startTime'] != null ? json['startTime'] as String : null;
    endTime = json['endTime'] != null ? json['endTime'] as String : null;
    color = json['color'] != null ? json['color'] as int : null;
    remind = json['remind'] != null ? json['remind'] as int : null;
    repeat = json['repeat'] != null ? json['repeat'] as String : null;
  }
}

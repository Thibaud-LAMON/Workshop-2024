import 'package:flutter/material.dart';

import 'enums/Recurrence.dart';
import 'enums/Status.dart';
import 'Cabinet.dart';
import 'Patient.dart';


class Visit {
  int? id;
  Patient patient;
  Cabinet cabinet;
  DateTime visitDate;
  Recurrence recurrence;
  TimeOfDay visitTime;
  Status status;
  String notes;
  DateTime createdAt;

  Visit({
    this.id,
    required this.patient,
    required this.cabinet,
    required this.visitDate,
    required this.recurrence,
    required this.visitTime,
    required this.status,
    required this.notes,
    required this.createdAt,
  });

  @override
  String toString() {
    return 'Visit{visitId: $id, patientId: $patient, cabinetId: $cabinet, visitDate: $visitDate, recurrence: $recurrence, visitTime: $visitTime, status: $status, notes: $notes, createdAt: $createdAt}';
  }
}
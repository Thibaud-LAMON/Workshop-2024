import 'package:flutter/material.dart';

import 'enums/visits/Recurrence.dart';
import 'enums/visits/Status.dart';
import 'Cabinet.dart';
import 'Patient.dart';


class Visit {
  int id;
  Patient patient;
  Cabinet cabinet;
  DateTime? visitDate;
  Recurrence recurrence = Recurrence.NONE;
  TimeOfDay visitTime;
  Status status = Status.SCHEDULED;
  String? notes;
  DateTime? createdAt = DateTime.now();

  Visit({
    required this.id,
    required this.patient,
    required this.cabinet,
    this.visitDate,
    required this.recurrence,
    required this.visitTime,
    required this.status,
    this.notes,
    this.createdAt,
  });

  @override
  String toString() {
    return 'Visit{visitId: $id, patientId: $patient, cabinetId: $cabinet, visitDate: $visitDate, recurrence: $recurrence, visitTime: $visitTime, status: $status, notes: $notes, createdAt: $createdAt}';
  }
}
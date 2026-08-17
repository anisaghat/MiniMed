import 'package:firestore_odm/firestore_odm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'medication.freezed.dart';
part 'medication.g.dart';

@freezed
@FirestoreOdm()
abstract class Medication with _$Medication {
  const factory Medication({
    @DocumentIdField() required String id,
    required String name,
    required double dosageValue,
    required String dosageUnit,
    required int timesPerDay,
    String? instructions,
    required DateTime createdAt,
  }) = _Medication;

  factory Medication.fromJson(Map<String, dynamic> json) =>
      _$MedicationFromJson(json);
}

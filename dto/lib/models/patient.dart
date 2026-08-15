import 'package:firestore_odm/firestore_odm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'patient.freezed.dart';
part 'patient.g.dart';

@freezed
@FirestoreOdm()
abstract class Patient with _$Patient {
  const factory Patient({
    @DocumentIdField() required String id,
    required String firstName,
    required String lastName,
    required DateTime dateOfBirth,
    required String gender,
    required String email,
    required String phoneNumber,
    required DateTime createdAt,
  }) = _Patient;

  factory Patient.fromJson(Map<String, dynamic> json) =>
      _$PatientFromJson(json);
}
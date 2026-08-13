import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'patient/patient.dart';

part 'schema.g.dart';

@Schema()
@Collection<Patient>('patients')
final patientSchema = _$PatientSchema;
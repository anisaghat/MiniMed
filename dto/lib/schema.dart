import 'package:dto/models/medication.dart';
import 'package:dto/models/user.dart';
import 'package:firestore_odm/firestore_odm.dart';
import 'package:dto/models/patient.dart';

part 'schema.g.dart';

@Schema()
@Collection<User>('users')
@Collection<Patient>('users/*/patients')
@Collection<Medication>('users/*/patients/*/medications')
final appSchema = _$AppSchema;

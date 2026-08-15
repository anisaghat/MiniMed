import 'package:dto/models/user.dart';
import 'package:firestore_odm/firestore_odm.dart';
import 'package:dto/models/patient.dart';
import 'package:dto/models/user.dart';

part 'schema.g.dart';

@Schema()
@Collection<User>('users')
@Collection<Patient>('users/*/patients')
final appSchema = _$AppSchema;
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schema.dart';

// **************************************************************************
// Generator: SchemaGenerator2
// **************************************************************************

/// Identifiers for all Firestore collections in the schema
/// Used to map collection paths to their respective collection classes
/// By combining collection classes (e.g., as tuple types),
/// we can use extension methods with record types to reduce boilerplate
/// Example: (_$UsersCollection, _$PostsCollection)
final class _$UsersCollection {}

final class _$PatientsCollection {}

final class _$MedicationsCollection {}

/// Generated schema class - dummy class that only serves as type marker
class AppSchema extends FirestoreSchema {
  const AppSchema();
}

/// Generated schema instance
const AppSchema _$AppSchema = AppSchema();

/// Class to add collections to `FirestoreODM<AppSchema>`
extension $AppSchemaODM on FirestoreODM<AppSchema> {
  /// Access users collection
  @pragma('vm:prefer-inline')
  FirestoreCollection<
    AppSchema,
    User,
    (_$UsersCollection,),
    UserPatchBuilder<User>,
    UserFilterBuilderRoot,
    UserOrderByBuilder,
    UserAggregateBuilderRoot
  >
  get users => FirestoreCollection(
    query: firestore.collection('users'),
    toJson: (value) => (value.toJson() as Map<String, dynamic>),
    fromJson: (value) => User.fromJson((value as Map<String, dynamic>)),
    documentIdField: 'id',
    patchBuilder: UserPatchBuilder<User>(
      toJson: (value) => (value.toJson() as Map<String, dynamic>),
    ),
    filterBuilder: UserFilterBuilderRoot(),
    orderByBuilderFunc: (context) => UserOrderByBuilder(context: context),
    aggregateBuilderFunc: (context) =>
        UserAggregateBuilderRoot(context: context),
  );
}

/// Extension to add collections to `TransactionContext<AppSchema>`
extension $AppSchemaTransactionContext on TransactionContext<AppSchema> {
  /// Access users collection
  @pragma('vm:prefer-inline')
  TransactionCollection<
    AppSchema,
    User,
    (_$UsersCollection,),
    UserPatchBuilder<User>
  >
  get users =>
      TransactionCollection<
        AppSchema,
        User,
        (_$UsersCollection,),
        UserPatchBuilder<User>
      >(
        query: ref.collection('users'),
        context: this,
        toJson: (value) => (value.toJson() as Map<String, dynamic>),
        fromJson: (value) => User.fromJson((value as Map<String, dynamic>)),
        documentIdField: 'id',
        patchBuilder: UserPatchBuilder<User>(
          toJson: (value) => (value.toJson() as Map<String, dynamic>),
        ),
      );
}

/// Transaction document class for users collection
extension $AppSchemaUsersTransactionDocument
    on
        TransactionDocument<
          AppSchema,
          User,
          (_$UsersCollection,),
          UserPatchBuilder<User>
        > {
  /// Access patients subcollection
  @pragma('vm:prefer-inline')
  TransactionCollection<
    AppSchema,
    Patient,
    (_$UsersCollection, _$PatientsCollection),
    PatientPatchBuilder<Patient>
  >
  get patients =>
      TransactionCollection<
        AppSchema,
        Patient,
        (_$UsersCollection, _$PatientsCollection),
        PatientPatchBuilder<Patient>
      >(
        query: ref.collection('patients'),
        context: context,
        toJson: (value) => (value.toJson() as Map<String, dynamic>),
        fromJson: (value) => Patient.fromJson((value as Map<String, dynamic>)),
        documentIdField: 'id',
        patchBuilder: PatientPatchBuilder<Patient>(
          toJson: (value) => (value.toJson() as Map<String, dynamic>),
        ),
      );
}

/// Transaction document class for users/*/patients collection
extension $AppSchemaUsersPatientsTransactionDocument
    on
        TransactionDocument<
          AppSchema,
          Patient,
          (_$UsersCollection, _$PatientsCollection),
          PatientPatchBuilder<Patient>
        > {
  /// Access medications subcollection
  @pragma('vm:prefer-inline')
  TransactionCollection<
    AppSchema,
    Medication,
    (_$UsersCollection, _$PatientsCollection, _$MedicationsCollection),
    MedicationPatchBuilder<Medication>
  >
  get medications =>
      TransactionCollection<
        AppSchema,
        Medication,
        (_$UsersCollection, _$PatientsCollection, _$MedicationsCollection),
        MedicationPatchBuilder<Medication>
      >(
        query: ref.collection('medications'),
        context: context,
        toJson: (value) => (value.toJson() as Map<String, dynamic>),
        fromJson: (value) =>
            Medication.fromJson((value as Map<String, dynamic>)),
        documentIdField: 'id',
        patchBuilder: MedicationPatchBuilder<Medication>(
          toJson: (value) => (value.toJson() as Map<String, dynamic>),
        ),
      );
}

/// Document class for users collection
extension $AppSchemaUsersDocument
    on
        FirestoreDocument<
          AppSchema,
          User,
          (_$UsersCollection,),
          UserPatchBuilder<User>
        > {
  /// Access patients subcollection
  FirestoreCollection<
    AppSchema,
    Patient,
    (_$UsersCollection, _$PatientsCollection),
    PatientPatchBuilder<Patient>,
    PatientFilterBuilderRoot,
    PatientOrderByBuilder,
    PatientAggregateBuilderRoot
  >
  get patients => FirestoreCollection(
    query: ref.collection('patients'),
    toJson: (value) => (value.toJson() as Map<String, dynamic>),
    fromJson: (value) => Patient.fromJson((value as Map<String, dynamic>)),
    documentIdField: 'id',
    patchBuilder: PatientPatchBuilder<Patient>(
      toJson: (value) => (value.toJson() as Map<String, dynamic>),
    ),
    filterBuilder: PatientFilterBuilderRoot(),
    orderByBuilderFunc: (context) => PatientOrderByBuilder(context: context),
    aggregateBuilderFunc: (context) =>
        PatientAggregateBuilderRoot(context: context),
  );
}

/// Document class for users/*/patients collection
extension $AppSchemaUsersPatientsDocument
    on
        FirestoreDocument<
          AppSchema,
          Patient,
          (_$UsersCollection, _$PatientsCollection),
          PatientPatchBuilder<Patient>
        > {
  /// Access medications subcollection
  FirestoreCollection<
    AppSchema,
    Medication,
    (_$UsersCollection, _$PatientsCollection, _$MedicationsCollection),
    MedicationPatchBuilder<Medication>,
    MedicationFilterBuilderRoot,
    MedicationOrderByBuilder,
    MedicationAggregateBuilderRoot
  >
  get medications => FirestoreCollection(
    query: ref.collection('medications'),
    toJson: (value) => (value.toJson() as Map<String, dynamic>),
    fromJson: (value) => Medication.fromJson((value as Map<String, dynamic>)),
    documentIdField: 'id',
    patchBuilder: MedicationPatchBuilder<Medication>(
      toJson: (value) => (value.toJson() as Map<String, dynamic>),
    ),
    filterBuilder: MedicationFilterBuilderRoot(),
    orderByBuilderFunc: (context) => MedicationOrderByBuilder(context: context),
    aggregateBuilderFunc: (context) =>
        MedicationAggregateBuilderRoot(context: context),
  );
}

/// Extension to add collections to BatchContext AppSchema
extension $AppSchemaBatchContextExtensions on BatchContext<AppSchema> {
  /// Access users collection
  BatchCollection<AppSchema, User, (_$UsersCollection,), UserPatchBuilder<User>>
  get users => BatchCollection(
    context: this,
    collection: firestoreInstance.collection('users'),
    toJson: (value) => (value.toJson() as Map<String, dynamic>),
    fromJson: (value) => User.fromJson((value as Map<String, dynamic>)),
    documentIdField: 'id',
    patchBuilder: UserPatchBuilder<User>(
      toJson: (value) => (value.toJson() as Map<String, dynamic>),
    ),
  );
}

/// Batch document class for users collection
extension $AppSchemaUsersBatchDocument
    on
        BatchDocument<
          AppSchema,
          User,
          (_$UsersCollection,),
          UserPatchBuilder<User>
        > {
  /// Access patients subcollection
  @pragma('vm:prefer-inline')
  BatchCollection<
    AppSchema,
    Patient,
    (_$UsersCollection, _$PatientsCollection),
    PatientPatchBuilder<Patient>
  >
  get patients => getBatchCollection(
    parent: this,
    name: 'patients',
    toJson: (value) => (value.toJson() as Map<String, dynamic>),
    fromJson: (value) => Patient.fromJson((value as Map<String, dynamic>)),
    documentIdField: 'id',
    patchBuilder: PatientPatchBuilder<Patient>(
      toJson: (value) => (value.toJson() as Map<String, dynamic>),
    ),
  );
}

/// Batch document class for users/*/patients collection
extension $AppSchemaUsersPatientsBatchDocument
    on
        BatchDocument<
          AppSchema,
          Patient,
          (_$UsersCollection, _$PatientsCollection),
          PatientPatchBuilder<Patient>
        > {
  /// Access medications subcollection
  @pragma('vm:prefer-inline')
  BatchCollection<
    AppSchema,
    Medication,
    (_$UsersCollection, _$PatientsCollection, _$MedicationsCollection),
    MedicationPatchBuilder<Medication>
  >
  get medications => getBatchCollection(
    parent: this,
    name: 'medications',
    toJson: (value) => (value.toJson() as Map<String, dynamic>),
    fromJson: (value) => Medication.fromJson((value as Map<String, dynamic>)),
    documentIdField: 'id',
    patchBuilder: MedicationPatchBuilder<Medication>(
      toJson: (value) => (value.toJson() as Map<String, dynamic>),
    ),
  );
}

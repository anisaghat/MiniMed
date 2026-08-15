// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Patient _$PatientFromJson(Map<String, dynamic> json) => _Patient(
  id: json['id'] as String,
  firstName: json['firstName'] as String,
  lastName: json['lastName'] as String,
  dateOfBirth: DateTime.parse(json['dateOfBirth'] as String),
  gender: json['gender'] as String,
  email: json['email'] as String,
  phoneNumber: json['phoneNumber'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$PatientToJson(_Patient instance) => <String, dynamic>{
  'id': instance.id,
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'dateOfBirth': instance.dateOfBirth.toIso8601String(),
  'gender': instance.gender,
  'email': instance.email,
  'phoneNumber': instance.phoneNumber,
  'createdAt': instance.createdAt.toIso8601String(),
};

// **************************************************************************
// ModelBuilderGenerator
// **************************************************************************

/// Patch builder for `Patient` model
class PatientPatchBuilder<$$T extends Patient?>
    extends PatchBuilder<$$T, Map<String, dynamic>?> {
  /// Creates a patch builder for `Patient`
  PatientPatchBuilder({required super.toJson, super.field});

  /// Update id field `String`
  late final PatchBuilder<String, String> id = PatchBuilder(
    field: path.append('id'),
    toJson: (value) => (value as String),
  );

  /// Update firstName field `String`
  late final PatchBuilder<String, String> firstName = PatchBuilder(
    field: path.append('firstName'),
    toJson: (value) => (value as String),
  );

  /// Update lastName field `String`
  late final PatchBuilder<String, String> lastName = PatchBuilder(
    field: path.append('lastName'),
    toJson: (value) => (value as String),
  );

  /// Update dateOfBirth field `DateTime`
  late final DateTimeFieldUpdate<DateTime> dateOfBirth = DateTimeFieldUpdate(
    field: path.append('dateOfBirth'),
  );

  /// Update gender field `String`
  late final PatchBuilder<String, String> gender = PatchBuilder(
    field: path.append('gender'),
    toJson: (value) => (value as String),
  );

  /// Update email field `String`
  late final PatchBuilder<String, String> email = PatchBuilder(
    field: path.append('email'),
    toJson: (value) => (value as String),
  );

  /// Update phoneNumber field `String`
  late final PatchBuilder<String, String> phoneNumber = PatchBuilder(
    field: path.append('phoneNumber'),
    toJson: (value) => (value as String),
  );

  /// Update createdAt field `DateTime`
  late final DateTimeFieldUpdate<DateTime> createdAt = DateTimeFieldUpdate(
    field: path.append('createdAt'),
  );
}

/// Generated FilterBuilder for `Patient`
class PatientFilterBuilder extends FilterBuilderNode {
  /// Creates a filter selector for `Patient`
  PatientFilterBuilder({super.field});

  /// Filter by id
  late final ComparableFilterField<String> id = ComparableFilterField<String>(
    field: FieldPath.documentId,
    toJson: (value) => (value as String),
  );

  /// Filter by firstName
  late final ComparableFilterField<String> firstName =
      ComparableFilterField<String>(
        field: path.append('firstName'),
        toJson: (value) => (value as String),
      );

  /// Filter by lastName
  late final ComparableFilterField<String> lastName =
      ComparableFilterField<String>(
        field: path.append('lastName'),
        toJson: (value) => (value as String),
      );

  /// Filter by dateOfBirth
  late final ComparableFilterField<DateTime> dateOfBirth =
      ComparableFilterField<DateTime>(
        field: path.append('dateOfBirth'),
        toJson: (value) => const DateTimeConverter().toJson(value),
      );

  /// Filter by gender
  late final ComparableFilterField<String> gender =
      ComparableFilterField<String>(
        field: path.append('gender'),
        toJson: (value) => (value as String),
      );

  /// Filter by email
  late final ComparableFilterField<String> email =
      ComparableFilterField<String>(
        field: path.append('email'),
        toJson: (value) => (value as String),
      );

  /// Filter by phoneNumber
  late final ComparableFilterField<String> phoneNumber =
      ComparableFilterField<String>(
        field: path.append('phoneNumber'),
        toJson: (value) => (value as String),
      );

  /// Filter by createdAt
  late final ComparableFilterField<DateTime> createdAt =
      ComparableFilterField<DateTime>(
        field: path.append('createdAt'),
        toJson: (value) => const DateTimeConverter().toJson(value),
      );
}

/// Generated RootFilterBuilder for `Patient`
class PatientFilterBuilderRoot extends PatientFilterBuilder
    with FilterBuilderRoot {
  /// Creates a root filter selector for `Patient`
  PatientFilterBuilderRoot();
}

/// Generated OrderByBuilder for `Patient`
class PatientOrderByBuilder extends OrderByFieldNode {
  /// Constructor for OrderByBuilder
  PatientOrderByBuilder({required super.context, super.field});

  /// Access nested id for ordering
  late final OrderByField<String> id = OrderByField<String>(
    field: FieldPath.documentId,
    context: $context,
  );

  /// Access nested firstName for ordering
  late final OrderByField<String> firstName = OrderByField<String>(
    field: path.append('firstName'),
    context: $context,
  );

  /// Access nested lastName for ordering
  late final OrderByField<String> lastName = OrderByField<String>(
    field: path.append('lastName'),
    context: $context,
  );

  /// Access nested dateOfBirth for ordering
  late final OrderByField<DateTime> dateOfBirth = OrderByField<DateTime>(
    field: path.append('dateOfBirth'),
    context: $context,
  );

  /// Access nested gender for ordering
  late final OrderByField<String> gender = OrderByField<String>(
    field: path.append('gender'),
    context: $context,
  );

  /// Access nested email for ordering
  late final OrderByField<String> email = OrderByField<String>(
    field: path.append('email'),
    context: $context,
  );

  /// Access nested phoneNumber for ordering
  late final OrderByField<String> phoneNumber = OrderByField<String>(
    field: path.append('phoneNumber'),
    context: $context,
  );

  /// Access nested createdAt for ordering
  late final OrderByField<DateTime> createdAt = OrderByField<DateTime>(
    field: path.append('createdAt'),
    context: $context,
  );
}

/// Generated AggregateFieldSelector for `Patient`
class PatientAggregateFieldSelector extends AggregateFieldNode {
  /// Constructor for AggregateFieldSelector
  PatientAggregateFieldSelector({required super.context, super.field});
}

/// Generated AggregateFieldSelector for `Patient`
class PatientAggregateBuilderRoot extends PatientAggregateFieldSelector
    with AggregateRootMixin
    implements AggregateBuilderRoot {
  /// Constructor for AggregateFieldSelector
  PatientAggregateBuilderRoot({required super.context, super.field});
}

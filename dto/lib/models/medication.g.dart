// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medication.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Medication _$MedicationFromJson(Map<String, dynamic> json) => _Medication(
  id: json['id'] as String,
  name: json['name'] as String,
  dosageValue: (json['dosageValue'] as num).toDouble(),
  dosageUnit: json['dosageUnit'] as String,
  timesPerDay: (json['timesPerDay'] as num).toInt(),
  instructions: json['instructions'] as String?,
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$MedicationToJson(_Medication instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'dosageValue': instance.dosageValue,
      'dosageUnit': instance.dosageUnit,
      'timesPerDay': instance.timesPerDay,
      'instructions': instance.instructions,
      'createdAt': instance.createdAt.toIso8601String(),
    };

// **************************************************************************
// ModelBuilderGenerator
// **************************************************************************

/// Patch builder for `Medication` model
class MedicationPatchBuilder<$$T extends Medication?>
    extends PatchBuilder<$$T, Map<String, dynamic>?> {
  /// Creates a patch builder for `Medication`
  MedicationPatchBuilder({required super.toJson, super.field});

  /// Update id field `String`
  late final PatchBuilder<String, String> id = PatchBuilder(
    field: path.append('id'),
    toJson: (value) => (value as String),
  );

  /// Update name field `String`
  late final PatchBuilder<String, String> name = PatchBuilder(
    field: path.append('name'),
    toJson: (value) => (value as String),
  );

  /// Update dosageValue field `double`
  late final NumericFieldUpdate<double> dosageValue = NumericFieldUpdate(
    field: path.append('dosageValue'),
  );

  /// Update dosageUnit field `String`
  late final PatchBuilder<String, String> dosageUnit = PatchBuilder(
    field: path.append('dosageUnit'),
    toJson: (value) => (value as String),
  );

  /// Update timesPerDay field `int`
  late final NumericFieldUpdate<int> timesPerDay = NumericFieldUpdate(
    field: path.append('timesPerDay'),
  );

  /// Update instructions field `String?`
  late final PatchBuilder<String?, String?> instructions = PatchBuilder(
    field: path.append('instructions'),
    toJson: (value) => (value as String?),
  );

  /// Update createdAt field `DateTime`
  late final DateTimeFieldUpdate<DateTime> createdAt = DateTimeFieldUpdate(
    field: path.append('createdAt'),
  );
}

/// Generated FilterBuilder for `Medication`
class MedicationFilterBuilder extends FilterBuilderNode {
  /// Creates a filter selector for `Medication`
  MedicationFilterBuilder({super.field});

  /// Filter by id
  late final ComparableFilterField<String> id = ComparableFilterField<String>(
    field: FieldPath.documentId,
    toJson: (value) => (value as String),
  );

  /// Filter by name
  late final ComparableFilterField<String> name = ComparableFilterField<String>(
    field: path.append('name'),
    toJson: (value) => (value as String),
  );

  /// Filter by dosageValue
  late final ComparableFilterField<double> dosageValue =
      ComparableFilterField<double>(
        field: path.append('dosageValue'),
        toJson: (value) => (value as double),
      );

  /// Filter by dosageUnit
  late final ComparableFilterField<String> dosageUnit =
      ComparableFilterField<String>(
        field: path.append('dosageUnit'),
        toJson: (value) => (value as String),
      );

  /// Filter by timesPerDay
  late final ComparableFilterField<int> timesPerDay =
      ComparableFilterField<int>(
        field: path.append('timesPerDay'),
        toJson: (value) => (value as int),
      );

  /// Filter by instructions
  late final ComparableFilterField<String?> instructions =
      ComparableFilterField<String?>(
        field: path.append('instructions'),
        toJson: (value) => (value as String?),
      );

  /// Filter by createdAt
  late final ComparableFilterField<DateTime> createdAt =
      ComparableFilterField<DateTime>(
        field: path.append('createdAt'),
        toJson: (value) => const DateTimeConverter().toJson(value),
      );
}

/// Generated RootFilterBuilder for `Medication`
class MedicationFilterBuilderRoot extends MedicationFilterBuilder
    with FilterBuilderRoot {
  /// Creates a root filter selector for `Medication`
  MedicationFilterBuilderRoot();
}

/// Generated OrderByBuilder for `Medication`
class MedicationOrderByBuilder extends OrderByFieldNode {
  /// Constructor for OrderByBuilder
  MedicationOrderByBuilder({required super.context, super.field});

  /// Access nested id for ordering
  late final OrderByField<String> id = OrderByField<String>(
    field: FieldPath.documentId,
    context: $context,
  );

  /// Access nested name for ordering
  late final OrderByField<String> name = OrderByField<String>(
    field: path.append('name'),
    context: $context,
  );

  /// Access nested dosageValue for ordering
  late final OrderByField<double> dosageValue = OrderByField<double>(
    field: path.append('dosageValue'),
    context: $context,
  );

  /// Access nested dosageUnit for ordering
  late final OrderByField<String> dosageUnit = OrderByField<String>(
    field: path.append('dosageUnit'),
    context: $context,
  );

  /// Access nested timesPerDay for ordering
  late final OrderByField<int> timesPerDay = OrderByField<int>(
    field: path.append('timesPerDay'),
    context: $context,
  );

  /// Access nested instructions for ordering
  late final OrderByField<String?> instructions = OrderByField<String?>(
    field: path.append('instructions'),
    context: $context,
  );

  /// Access nested createdAt for ordering
  late final OrderByField<DateTime> createdAt = OrderByField<DateTime>(
    field: path.append('createdAt'),
    context: $context,
  );
}

/// Generated AggregateFieldSelector for `Medication`
class MedicationAggregateFieldSelector extends AggregateFieldNode {
  /// Constructor for AggregateFieldSelector
  MedicationAggregateFieldSelector({required super.context, super.field});

  /// dosageValue field for aggregation
  late final AggregateField<double> dosageValue = AggregateField<double>(
    field: path.append('dosageValue'),
    context: $context,
  );

  /// timesPerDay field for aggregation
  late final AggregateField<int> timesPerDay = AggregateField<int>(
    field: path.append('timesPerDay'),
    context: $context,
  );
}

/// Generated AggregateFieldSelector for `Medication`
class MedicationAggregateBuilderRoot extends MedicationAggregateFieldSelector
    with AggregateRootMixin
    implements AggregateBuilderRoot {
  /// Constructor for AggregateFieldSelector
  MedicationAggregateBuilderRoot({required super.context, super.field});
}

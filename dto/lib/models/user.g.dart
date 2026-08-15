// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_User _$UserFromJson(Map<String, dynamic> json) => _User(
  id: json['id'] as String,
  username: json['username'] as String,
  email: json['email'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$UserToJson(_User instance) => <String, dynamic>{
  'id': instance.id,
  'username': instance.username,
  'email': instance.email,
  'createdAt': instance.createdAt.toIso8601String(),
};

// **************************************************************************
// ModelBuilderGenerator
// **************************************************************************

/// Patch builder for `User` model
class UserPatchBuilder<$$T extends User?>
    extends PatchBuilder<$$T, Map<String, dynamic>?> {
  /// Creates a patch builder for `User`
  UserPatchBuilder({required super.toJson, super.field});

  /// Update id field `String`
  late final PatchBuilder<String, String> id = PatchBuilder(
    field: path.append('id'),
    toJson: (value) => (value as String),
  );

  /// Update username field `String`
  late final PatchBuilder<String, String> username = PatchBuilder(
    field: path.append('username'),
    toJson: (value) => (value as String),
  );

  /// Update email field `String`
  late final PatchBuilder<String, String> email = PatchBuilder(
    field: path.append('email'),
    toJson: (value) => (value as String),
  );

  /// Update createdAt field `DateTime`
  late final DateTimeFieldUpdate<DateTime> createdAt = DateTimeFieldUpdate(
    field: path.append('createdAt'),
  );
}

/// Generated FilterBuilder for `User`
class UserFilterBuilder extends FilterBuilderNode {
  /// Creates a filter selector for `User`
  UserFilterBuilder({super.field});

  /// Filter by id
  late final ComparableFilterField<String> id = ComparableFilterField<String>(
    field: FieldPath.documentId,
    toJson: (value) => (value as String),
  );

  /// Filter by username
  late final ComparableFilterField<String> username =
      ComparableFilterField<String>(
        field: path.append('username'),
        toJson: (value) => (value as String),
      );

  /// Filter by email
  late final ComparableFilterField<String> email =
      ComparableFilterField<String>(
        field: path.append('email'),
        toJson: (value) => (value as String),
      );

  /// Filter by createdAt
  late final ComparableFilterField<DateTime> createdAt =
      ComparableFilterField<DateTime>(
        field: path.append('createdAt'),
        toJson: (value) => const DateTimeConverter().toJson(value),
      );
}

/// Generated RootFilterBuilder for `User`
class UserFilterBuilderRoot extends UserFilterBuilder with FilterBuilderRoot {
  /// Creates a root filter selector for `User`
  UserFilterBuilderRoot();
}

/// Generated OrderByBuilder for `User`
class UserOrderByBuilder extends OrderByFieldNode {
  /// Constructor for OrderByBuilder
  UserOrderByBuilder({required super.context, super.field});

  /// Access nested id for ordering
  late final OrderByField<String> id = OrderByField<String>(
    field: FieldPath.documentId,
    context: $context,
  );

  /// Access nested username for ordering
  late final OrderByField<String> username = OrderByField<String>(
    field: path.append('username'),
    context: $context,
  );

  /// Access nested email for ordering
  late final OrderByField<String> email = OrderByField<String>(
    field: path.append('email'),
    context: $context,
  );

  /// Access nested createdAt for ordering
  late final OrderByField<DateTime> createdAt = OrderByField<DateTime>(
    field: path.append('createdAt'),
    context: $context,
  );
}

/// Generated AggregateFieldSelector for `User`
class UserAggregateFieldSelector extends AggregateFieldNode {
  /// Constructor for AggregateFieldSelector
  UserAggregateFieldSelector({required super.context, super.field});
}

/// Generated AggregateFieldSelector for `User`
class UserAggregateBuilderRoot extends UserAggregateFieldSelector
    with AggregateRootMixin
    implements AggregateBuilderRoot {
  /// Constructor for AggregateFieldSelector
  UserAggregateBuilderRoot({required super.context, super.field});
}

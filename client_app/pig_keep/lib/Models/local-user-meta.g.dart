// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local-user-meta.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetLocalUserMetaCollection on Isar {
  IsarCollection<LocalUserMeta> get localUserMetas => this.collection();
}

const LocalUserMetaSchema = CollectionSchema(
  name: r'LocalUserMeta',
  id: 5781237994559325426,
  properties: {
    r'createdAt': PropertySchema(
      id: 0,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'farmID': PropertySchema(
      id: 1,
      name: r'farmID',
      type: IsarType.string,
    ),
    r'lastSuccesfulReadSync': PropertySchema(
      id: 2,
      name: r'lastSuccesfulReadSync',
      type: IsarType.dateTime,
    ),
    r'lastSuccesfulWriteSync': PropertySchema(
      id: 3,
      name: r'lastSuccesfulWriteSync',
      type: IsarType.dateTime,
    ),
    r'model': PropertySchema(
      id: 4,
      name: r'model',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 5,
      name: r'updatedAt',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _localUserMetaEstimateSize,
  serialize: _localUserMetaSerialize,
  deserialize: _localUserMetaDeserialize,
  deserializeProp: _localUserMetaDeserializeProp,
  idName: r'isarID',
  indexes: {
    r'farmID': IndexSchema(
      id: -8294907866159977195,
      name: r'farmID',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'farmID',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _localUserMetaGetId,
  getLinks: _localUserMetaGetLinks,
  attach: _localUserMetaAttach,
  version: '3.1.0+1',
);

int _localUserMetaEstimateSize(
  LocalUserMeta object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.farmID.length * 3;
  bytesCount += 3 + object.model.length * 3;
  return bytesCount;
}

void _localUserMetaSerialize(
  LocalUserMeta object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createdAt);
  writer.writeString(offsets[1], object.farmID);
  writer.writeDateTime(offsets[2], object.lastSuccesfulReadSync);
  writer.writeDateTime(offsets[3], object.lastSuccesfulWriteSync);
  writer.writeString(offsets[4], object.model);
  writer.writeDateTime(offsets[5], object.updatedAt);
}

LocalUserMeta _localUserMetaDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = LocalUserMeta();
  object.createdAt = reader.readDateTime(offsets[0]);
  object.farmID = reader.readString(offsets[1]);
  object.isarID = id;
  object.lastSuccesfulReadSync = reader.readDateTimeOrNull(offsets[2]);
  object.lastSuccesfulWriteSync = reader.readDateTimeOrNull(offsets[3]);
  object.model = reader.readString(offsets[4]);
  object.updatedAt = reader.readDateTime(offsets[5]);
  return object;
}

P _localUserMetaDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 3:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _localUserMetaGetId(LocalUserMeta object) {
  return object.isarID;
}

List<IsarLinkBase<dynamic>> _localUserMetaGetLinks(LocalUserMeta object) {
  return [];
}

void _localUserMetaAttach(
    IsarCollection<dynamic> col, Id id, LocalUserMeta object) {
  object.isarID = id;
}

extension LocalUserMetaQueryWhereSort
    on QueryBuilder<LocalUserMeta, LocalUserMeta, QWhere> {
  QueryBuilder<LocalUserMeta, LocalUserMeta, QAfterWhere> anyIsarID() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension LocalUserMetaQueryWhere
    on QueryBuilder<LocalUserMeta, LocalUserMeta, QWhereClause> {
  QueryBuilder<LocalUserMeta, LocalUserMeta, QAfterWhereClause> isarIDEqualTo(
      Id isarID) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarID,
        upper: isarID,
      ));
    });
  }

  QueryBuilder<LocalUserMeta, LocalUserMeta, QAfterWhereClause>
      isarIDNotEqualTo(Id isarID) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarID, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarID, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarID, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarID, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<LocalUserMeta, LocalUserMeta, QAfterWhereClause>
      isarIDGreaterThan(Id isarID, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarID, includeLower: include),
      );
    });
  }

  QueryBuilder<LocalUserMeta, LocalUserMeta, QAfterWhereClause> isarIDLessThan(
      Id isarID,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarID, includeUpper: include),
      );
    });
  }

  QueryBuilder<LocalUserMeta, LocalUserMeta, QAfterWhereClause> isarIDBetween(
    Id lowerIsarID,
    Id upperIsarID, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerIsarID,
        includeLower: includeLower,
        upper: upperIsarID,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LocalUserMeta, LocalUserMeta, QAfterWhereClause> farmIDEqualTo(
      String farmID) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'farmID',
        value: [farmID],
      ));
    });
  }

  QueryBuilder<LocalUserMeta, LocalUserMeta, QAfterWhereClause>
      farmIDNotEqualTo(String farmID) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'farmID',
              lower: [],
              upper: [farmID],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'farmID',
              lower: [farmID],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'farmID',
              lower: [farmID],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'farmID',
              lower: [],
              upper: [farmID],
              includeUpper: false,
            ));
      }
    });
  }
}

extension LocalUserMetaQueryFilter
    on QueryBuilder<LocalUserMeta, LocalUserMeta, QFilterCondition> {
  QueryBuilder<LocalUserMeta, LocalUserMeta, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalUserMeta, LocalUserMeta, QAfterFilterCondition>
      createdAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalUserMeta, LocalUserMeta, QAfterFilterCondition>
      createdAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalUserMeta, LocalUserMeta, QAfterFilterCondition>
      createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LocalUserMeta, LocalUserMeta, QAfterFilterCondition>
      farmIDEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'farmID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalUserMeta, LocalUserMeta, QAfterFilterCondition>
      farmIDGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'farmID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalUserMeta, LocalUserMeta, QAfterFilterCondition>
      farmIDLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'farmID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalUserMeta, LocalUserMeta, QAfterFilterCondition>
      farmIDBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'farmID',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalUserMeta, LocalUserMeta, QAfterFilterCondition>
      farmIDStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'farmID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalUserMeta, LocalUserMeta, QAfterFilterCondition>
      farmIDEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'farmID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalUserMeta, LocalUserMeta, QAfterFilterCondition>
      farmIDContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'farmID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalUserMeta, LocalUserMeta, QAfterFilterCondition>
      farmIDMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'farmID',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalUserMeta, LocalUserMeta, QAfterFilterCondition>
      farmIDIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'farmID',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalUserMeta, LocalUserMeta, QAfterFilterCondition>
      farmIDIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'farmID',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalUserMeta, LocalUserMeta, QAfterFilterCondition>
      isarIDEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarID',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalUserMeta, LocalUserMeta, QAfterFilterCondition>
      isarIDGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'isarID',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalUserMeta, LocalUserMeta, QAfterFilterCondition>
      isarIDLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'isarID',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalUserMeta, LocalUserMeta, QAfterFilterCondition>
      isarIDBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'isarID',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LocalUserMeta, LocalUserMeta, QAfterFilterCondition>
      lastSuccesfulReadSyncIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastSuccesfulReadSync',
      ));
    });
  }

  QueryBuilder<LocalUserMeta, LocalUserMeta, QAfterFilterCondition>
      lastSuccesfulReadSyncIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastSuccesfulReadSync',
      ));
    });
  }

  QueryBuilder<LocalUserMeta, LocalUserMeta, QAfterFilterCondition>
      lastSuccesfulReadSyncEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastSuccesfulReadSync',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalUserMeta, LocalUserMeta, QAfterFilterCondition>
      lastSuccesfulReadSyncGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastSuccesfulReadSync',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalUserMeta, LocalUserMeta, QAfterFilterCondition>
      lastSuccesfulReadSyncLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastSuccesfulReadSync',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalUserMeta, LocalUserMeta, QAfterFilterCondition>
      lastSuccesfulReadSyncBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastSuccesfulReadSync',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LocalUserMeta, LocalUserMeta, QAfterFilterCondition>
      lastSuccesfulWriteSyncIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastSuccesfulWriteSync',
      ));
    });
  }

  QueryBuilder<LocalUserMeta, LocalUserMeta, QAfterFilterCondition>
      lastSuccesfulWriteSyncIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastSuccesfulWriteSync',
      ));
    });
  }

  QueryBuilder<LocalUserMeta, LocalUserMeta, QAfterFilterCondition>
      lastSuccesfulWriteSyncEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastSuccesfulWriteSync',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalUserMeta, LocalUserMeta, QAfterFilterCondition>
      lastSuccesfulWriteSyncGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastSuccesfulWriteSync',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalUserMeta, LocalUserMeta, QAfterFilterCondition>
      lastSuccesfulWriteSyncLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastSuccesfulWriteSync',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalUserMeta, LocalUserMeta, QAfterFilterCondition>
      lastSuccesfulWriteSyncBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastSuccesfulWriteSync',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LocalUserMeta, LocalUserMeta, QAfterFilterCondition>
      modelEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'model',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalUserMeta, LocalUserMeta, QAfterFilterCondition>
      modelGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'model',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalUserMeta, LocalUserMeta, QAfterFilterCondition>
      modelLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'model',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalUserMeta, LocalUserMeta, QAfterFilterCondition>
      modelBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'model',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalUserMeta, LocalUserMeta, QAfterFilterCondition>
      modelStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'model',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalUserMeta, LocalUserMeta, QAfterFilterCondition>
      modelEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'model',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalUserMeta, LocalUserMeta, QAfterFilterCondition>
      modelContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'model',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalUserMeta, LocalUserMeta, QAfterFilterCondition>
      modelMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'model',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalUserMeta, LocalUserMeta, QAfterFilterCondition>
      modelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'model',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalUserMeta, LocalUserMeta, QAfterFilterCondition>
      modelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'model',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalUserMeta, LocalUserMeta, QAfterFilterCondition>
      updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalUserMeta, LocalUserMeta, QAfterFilterCondition>
      updatedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalUserMeta, LocalUserMeta, QAfterFilterCondition>
      updatedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalUserMeta, LocalUserMeta, QAfterFilterCondition>
      updatedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'updatedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension LocalUserMetaQueryObject
    on QueryBuilder<LocalUserMeta, LocalUserMeta, QFilterCondition> {}

extension LocalUserMetaQueryLinks
    on QueryBuilder<LocalUserMeta, LocalUserMeta, QFilterCondition> {}

extension LocalUserMetaQuerySortBy
    on QueryBuilder<LocalUserMeta, LocalUserMeta, QSortBy> {
  QueryBuilder<LocalUserMeta, LocalUserMeta, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<LocalUserMeta, LocalUserMeta, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<LocalUserMeta, LocalUserMeta, QAfterSortBy> sortByFarmID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmID', Sort.asc);
    });
  }

  QueryBuilder<LocalUserMeta, LocalUserMeta, QAfterSortBy> sortByFarmIDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmID', Sort.desc);
    });
  }

  QueryBuilder<LocalUserMeta, LocalUserMeta, QAfterSortBy>
      sortByLastSuccesfulReadSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSuccesfulReadSync', Sort.asc);
    });
  }

  QueryBuilder<LocalUserMeta, LocalUserMeta, QAfterSortBy>
      sortByLastSuccesfulReadSyncDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSuccesfulReadSync', Sort.desc);
    });
  }

  QueryBuilder<LocalUserMeta, LocalUserMeta, QAfterSortBy>
      sortByLastSuccesfulWriteSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSuccesfulWriteSync', Sort.asc);
    });
  }

  QueryBuilder<LocalUserMeta, LocalUserMeta, QAfterSortBy>
      sortByLastSuccesfulWriteSyncDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSuccesfulWriteSync', Sort.desc);
    });
  }

  QueryBuilder<LocalUserMeta, LocalUserMeta, QAfterSortBy> sortByModel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'model', Sort.asc);
    });
  }

  QueryBuilder<LocalUserMeta, LocalUserMeta, QAfterSortBy> sortByModelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'model', Sort.desc);
    });
  }

  QueryBuilder<LocalUserMeta, LocalUserMeta, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<LocalUserMeta, LocalUserMeta, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension LocalUserMetaQuerySortThenBy
    on QueryBuilder<LocalUserMeta, LocalUserMeta, QSortThenBy> {
  QueryBuilder<LocalUserMeta, LocalUserMeta, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<LocalUserMeta, LocalUserMeta, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<LocalUserMeta, LocalUserMeta, QAfterSortBy> thenByFarmID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmID', Sort.asc);
    });
  }

  QueryBuilder<LocalUserMeta, LocalUserMeta, QAfterSortBy> thenByFarmIDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmID', Sort.desc);
    });
  }

  QueryBuilder<LocalUserMeta, LocalUserMeta, QAfterSortBy> thenByIsarID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarID', Sort.asc);
    });
  }

  QueryBuilder<LocalUserMeta, LocalUserMeta, QAfterSortBy> thenByIsarIDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarID', Sort.desc);
    });
  }

  QueryBuilder<LocalUserMeta, LocalUserMeta, QAfterSortBy>
      thenByLastSuccesfulReadSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSuccesfulReadSync', Sort.asc);
    });
  }

  QueryBuilder<LocalUserMeta, LocalUserMeta, QAfterSortBy>
      thenByLastSuccesfulReadSyncDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSuccesfulReadSync', Sort.desc);
    });
  }

  QueryBuilder<LocalUserMeta, LocalUserMeta, QAfterSortBy>
      thenByLastSuccesfulWriteSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSuccesfulWriteSync', Sort.asc);
    });
  }

  QueryBuilder<LocalUserMeta, LocalUserMeta, QAfterSortBy>
      thenByLastSuccesfulWriteSyncDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSuccesfulWriteSync', Sort.desc);
    });
  }

  QueryBuilder<LocalUserMeta, LocalUserMeta, QAfterSortBy> thenByModel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'model', Sort.asc);
    });
  }

  QueryBuilder<LocalUserMeta, LocalUserMeta, QAfterSortBy> thenByModelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'model', Sort.desc);
    });
  }

  QueryBuilder<LocalUserMeta, LocalUserMeta, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<LocalUserMeta, LocalUserMeta, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension LocalUserMetaQueryWhereDistinct
    on QueryBuilder<LocalUserMeta, LocalUserMeta, QDistinct> {
  QueryBuilder<LocalUserMeta, LocalUserMeta, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<LocalUserMeta, LocalUserMeta, QDistinct> distinctByFarmID(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'farmID', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalUserMeta, LocalUserMeta, QDistinct>
      distinctByLastSuccesfulReadSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastSuccesfulReadSync');
    });
  }

  QueryBuilder<LocalUserMeta, LocalUserMeta, QDistinct>
      distinctByLastSuccesfulWriteSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastSuccesfulWriteSync');
    });
  }

  QueryBuilder<LocalUserMeta, LocalUserMeta, QDistinct> distinctByModel(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'model', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalUserMeta, LocalUserMeta, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension LocalUserMetaQueryProperty
    on QueryBuilder<LocalUserMeta, LocalUserMeta, QQueryProperty> {
  QueryBuilder<LocalUserMeta, int, QQueryOperations> isarIDProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarID');
    });
  }

  QueryBuilder<LocalUserMeta, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<LocalUserMeta, String, QQueryOperations> farmIDProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'farmID');
    });
  }

  QueryBuilder<LocalUserMeta, DateTime?, QQueryOperations>
      lastSuccesfulReadSyncProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastSuccesfulReadSync');
    });
  }

  QueryBuilder<LocalUserMeta, DateTime?, QQueryOperations>
      lastSuccesfulWriteSyncProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastSuccesfulWriteSync');
    });
  }

  QueryBuilder<LocalUserMeta, String, QQueryOperations> modelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'model');
    });
  }

  QueryBuilder<LocalUserMeta, DateTime, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}

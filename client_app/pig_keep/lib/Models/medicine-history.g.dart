// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicine-history.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMedicineHistoryCollection on Isar {
  IsarCollection<MedicineHistory> get medicineHistorys => this.collection();
}

const MedicineHistorySchema = CollectionSchema(
  name: r'MedicineHistory',
  id: 4019115351778597943,
  properties: {
    r'cost': PropertySchema(
      id: 0,
      name: r'cost',
      type: IsarType.double,
    ),
    r'createdAt': PropertySchema(
      id: 1,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'dosage': PropertySchema(
      id: 2,
      name: r'dosage',
      type: IsarType.string,
    ),
    r'farmID': PropertySchema(
      id: 3,
      name: r'farmID',
      type: IsarType.string,
    ),
    r'medicineName': PropertySchema(
      id: 4,
      name: r'medicineName',
      type: IsarType.string,
    ),
    r'pigUuid': PropertySchema(
      id: 5,
      name: r'pigUuid',
      type: IsarType.string,
    ),
    r'quantity': PropertySchema(
      id: 6,
      name: r'quantity',
      type: IsarType.long,
    ),
    r'status': PropertySchema(
      id: 7,
      name: r'status',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 8,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'uuid': PropertySchema(
      id: 9,
      name: r'uuid',
      type: IsarType.string,
    )
  },
  estimateSize: _medicineHistoryEstimateSize,
  serialize: _medicineHistorySerialize,
  deserialize: _medicineHistoryDeserialize,
  deserializeProp: _medicineHistoryDeserializeProp,
  idName: r'isarID',
  indexes: {
    r'uuid': IndexSchema(
      id: 2134397340427724972,
      name: r'uuid',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'uuid',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'medicineName': IndexSchema(
      id: 819219057635901769,
      name: r'medicineName',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'medicineName',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'pigUuid': IndexSchema(
      id: -4773289992869511664,
      name: r'pigUuid',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'pigUuid',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
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
  getId: _medicineHistoryGetId,
  getLinks: _medicineHistoryGetLinks,
  attach: _medicineHistoryAttach,
  version: '3.1.0+1',
);

int _medicineHistoryEstimateSize(
  MedicineHistory object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.dosage.length * 3;
  bytesCount += 3 + object.farmID.length * 3;
  bytesCount += 3 + object.medicineName.length * 3;
  {
    final value = object.pigUuid;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.status.length * 3;
  bytesCount += 3 + object.uuid.length * 3;
  return bytesCount;
}

void _medicineHistorySerialize(
  MedicineHistory object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.cost);
  writer.writeDateTime(offsets[1], object.createdAt);
  writer.writeString(offsets[2], object.dosage);
  writer.writeString(offsets[3], object.farmID);
  writer.writeString(offsets[4], object.medicineName);
  writer.writeString(offsets[5], object.pigUuid);
  writer.writeLong(offsets[6], object.quantity);
  writer.writeString(offsets[7], object.status);
  writer.writeDateTime(offsets[8], object.updatedAt);
  writer.writeString(offsets[9], object.uuid);
}

MedicineHistory _medicineHistoryDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MedicineHistory();
  object.cost = reader.readDouble(offsets[0]);
  object.createdAt = reader.readDateTime(offsets[1]);
  object.dosage = reader.readString(offsets[2]);
  object.farmID = reader.readString(offsets[3]);
  object.isarID = id;
  object.medicineName = reader.readString(offsets[4]);
  object.pigUuid = reader.readStringOrNull(offsets[5]);
  object.quantity = reader.readLong(offsets[6]);
  object.status = reader.readString(offsets[7]);
  object.updatedAt = reader.readDateTime(offsets[8]);
  object.uuid = reader.readString(offsets[9]);
  return object;
}

P _medicineHistoryDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readDateTime(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _medicineHistoryGetId(MedicineHistory object) {
  return object.isarID;
}

List<IsarLinkBase<dynamic>> _medicineHistoryGetLinks(MedicineHistory object) {
  return [];
}

void _medicineHistoryAttach(
    IsarCollection<dynamic> col, Id id, MedicineHistory object) {
  object.isarID = id;
}

extension MedicineHistoryQueryWhereSort
    on QueryBuilder<MedicineHistory, MedicineHistory, QWhere> {
  QueryBuilder<MedicineHistory, MedicineHistory, QAfterWhere> anyIsarID() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension MedicineHistoryQueryWhere
    on QueryBuilder<MedicineHistory, MedicineHistory, QWhereClause> {
  QueryBuilder<MedicineHistory, MedicineHistory, QAfterWhereClause>
      isarIDEqualTo(Id isarID) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarID,
        upper: isarID,
      ));
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterWhereClause>
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

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterWhereClause>
      isarIDGreaterThan(Id isarID, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarID, includeLower: include),
      );
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterWhereClause>
      isarIDLessThan(Id isarID, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarID, includeUpper: include),
      );
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterWhereClause>
      isarIDBetween(
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

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterWhereClause> uuidEqualTo(
      String uuid) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'uuid',
        value: [uuid],
      ));
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterWhereClause>
      uuidNotEqualTo(String uuid) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'uuid',
              lower: [],
              upper: [uuid],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'uuid',
              lower: [uuid],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'uuid',
              lower: [uuid],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'uuid',
              lower: [],
              upper: [uuid],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterWhereClause>
      medicineNameEqualTo(String medicineName) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'medicineName',
        value: [medicineName],
      ));
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterWhereClause>
      medicineNameNotEqualTo(String medicineName) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'medicineName',
              lower: [],
              upper: [medicineName],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'medicineName',
              lower: [medicineName],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'medicineName',
              lower: [medicineName],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'medicineName',
              lower: [],
              upper: [medicineName],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterWhereClause>
      pigUuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'pigUuid',
        value: [null],
      ));
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterWhereClause>
      pigUuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'pigUuid',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterWhereClause>
      pigUuidEqualTo(String? pigUuid) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'pigUuid',
        value: [pigUuid],
      ));
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterWhereClause>
      pigUuidNotEqualTo(String? pigUuid) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'pigUuid',
              lower: [],
              upper: [pigUuid],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'pigUuid',
              lower: [pigUuid],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'pigUuid',
              lower: [pigUuid],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'pigUuid',
              lower: [],
              upper: [pigUuid],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterWhereClause>
      farmIDEqualTo(String farmID) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'farmID',
        value: [farmID],
      ));
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterWhereClause>
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

extension MedicineHistoryQueryFilter
    on QueryBuilder<MedicineHistory, MedicineHistory, QFilterCondition> {
  QueryBuilder<MedicineHistory, MedicineHistory, QAfterFilterCondition>
      costEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterFilterCondition>
      costGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterFilterCondition>
      costLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterFilterCondition>
      costBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cost',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterFilterCondition>
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

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterFilterCondition>
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

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterFilterCondition>
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

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterFilterCondition>
      dosageEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dosage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterFilterCondition>
      dosageGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dosage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterFilterCondition>
      dosageLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dosage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterFilterCondition>
      dosageBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dosage',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterFilterCondition>
      dosageStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'dosage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterFilterCondition>
      dosageEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'dosage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterFilterCondition>
      dosageContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'dosage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterFilterCondition>
      dosageMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'dosage',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterFilterCondition>
      dosageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dosage',
        value: '',
      ));
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterFilterCondition>
      dosageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'dosage',
        value: '',
      ));
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterFilterCondition>
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

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterFilterCondition>
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

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterFilterCondition>
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

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterFilterCondition>
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

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterFilterCondition>
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

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterFilterCondition>
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

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterFilterCondition>
      farmIDContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'farmID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterFilterCondition>
      farmIDMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'farmID',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterFilterCondition>
      farmIDIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'farmID',
        value: '',
      ));
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterFilterCondition>
      farmIDIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'farmID',
        value: '',
      ));
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterFilterCondition>
      isarIDEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarID',
        value: value,
      ));
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterFilterCondition>
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

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterFilterCondition>
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

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterFilterCondition>
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

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterFilterCondition>
      medicineNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'medicineName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterFilterCondition>
      medicineNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'medicineName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterFilterCondition>
      medicineNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'medicineName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterFilterCondition>
      medicineNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'medicineName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterFilterCondition>
      medicineNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'medicineName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterFilterCondition>
      medicineNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'medicineName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterFilterCondition>
      medicineNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'medicineName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterFilterCondition>
      medicineNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'medicineName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterFilterCondition>
      medicineNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'medicineName',
        value: '',
      ));
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterFilterCondition>
      medicineNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'medicineName',
        value: '',
      ));
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterFilterCondition>
      pigUuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pigUuid',
      ));
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterFilterCondition>
      pigUuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pigUuid',
      ));
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterFilterCondition>
      pigUuidEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pigUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterFilterCondition>
      pigUuidGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pigUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterFilterCondition>
      pigUuidLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pigUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterFilterCondition>
      pigUuidBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pigUuid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterFilterCondition>
      pigUuidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'pigUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterFilterCondition>
      pigUuidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'pigUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterFilterCondition>
      pigUuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'pigUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterFilterCondition>
      pigUuidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'pigUuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterFilterCondition>
      pigUuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pigUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterFilterCondition>
      pigUuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'pigUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterFilterCondition>
      quantityEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quantity',
        value: value,
      ));
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterFilterCondition>
      quantityGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'quantity',
        value: value,
      ));
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterFilterCondition>
      quantityLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'quantity',
        value: value,
      ));
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterFilterCondition>
      quantityBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'quantity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterFilterCondition>
      statusEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterFilterCondition>
      statusGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterFilterCondition>
      statusLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterFilterCondition>
      statusBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'status',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterFilterCondition>
      statusStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterFilterCondition>
      statusEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterFilterCondition>
      statusContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterFilterCondition>
      statusMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'status',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterFilterCondition>
      statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterFilterCondition>
      statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterFilterCondition>
      updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterFilterCondition>
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

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterFilterCondition>
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

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterFilterCondition>
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

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterFilterCondition>
      uuidEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterFilterCondition>
      uuidGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterFilterCondition>
      uuidLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterFilterCondition>
      uuidBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'uuid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterFilterCondition>
      uuidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterFilterCondition>
      uuidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterFilterCondition>
      uuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterFilterCondition>
      uuidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'uuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterFilterCondition>
      uuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uuid',
        value: '',
      ));
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterFilterCondition>
      uuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'uuid',
        value: '',
      ));
    });
  }
}

extension MedicineHistoryQueryObject
    on QueryBuilder<MedicineHistory, MedicineHistory, QFilterCondition> {}

extension MedicineHistoryQueryLinks
    on QueryBuilder<MedicineHistory, MedicineHistory, QFilterCondition> {}

extension MedicineHistoryQuerySortBy
    on QueryBuilder<MedicineHistory, MedicineHistory, QSortBy> {
  QueryBuilder<MedicineHistory, MedicineHistory, QAfterSortBy> sortByCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cost', Sort.asc);
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterSortBy>
      sortByCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cost', Sort.desc);
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterSortBy> sortByDosage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dosage', Sort.asc);
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterSortBy>
      sortByDosageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dosage', Sort.desc);
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterSortBy> sortByFarmID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmID', Sort.asc);
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterSortBy>
      sortByFarmIDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmID', Sort.desc);
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterSortBy>
      sortByMedicineName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'medicineName', Sort.asc);
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterSortBy>
      sortByMedicineNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'medicineName', Sort.desc);
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterSortBy> sortByPigUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pigUuid', Sort.asc);
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterSortBy>
      sortByPigUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pigUuid', Sort.desc);
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterSortBy>
      sortByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.asc);
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterSortBy>
      sortByQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.desc);
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterSortBy>
      sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterSortBy>
      sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterSortBy> sortByUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.asc);
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterSortBy>
      sortByUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.desc);
    });
  }
}

extension MedicineHistoryQuerySortThenBy
    on QueryBuilder<MedicineHistory, MedicineHistory, QSortThenBy> {
  QueryBuilder<MedicineHistory, MedicineHistory, QAfterSortBy> thenByCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cost', Sort.asc);
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterSortBy>
      thenByCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cost', Sort.desc);
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterSortBy> thenByDosage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dosage', Sort.asc);
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterSortBy>
      thenByDosageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dosage', Sort.desc);
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterSortBy> thenByFarmID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmID', Sort.asc);
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterSortBy>
      thenByFarmIDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmID', Sort.desc);
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterSortBy> thenByIsarID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarID', Sort.asc);
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterSortBy>
      thenByIsarIDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarID', Sort.desc);
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterSortBy>
      thenByMedicineName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'medicineName', Sort.asc);
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterSortBy>
      thenByMedicineNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'medicineName', Sort.desc);
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterSortBy> thenByPigUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pigUuid', Sort.asc);
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterSortBy>
      thenByPigUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pigUuid', Sort.desc);
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterSortBy>
      thenByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.asc);
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterSortBy>
      thenByQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.desc);
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterSortBy>
      thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterSortBy>
      thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterSortBy> thenByUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.asc);
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QAfterSortBy>
      thenByUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.desc);
    });
  }
}

extension MedicineHistoryQueryWhereDistinct
    on QueryBuilder<MedicineHistory, MedicineHistory, QDistinct> {
  QueryBuilder<MedicineHistory, MedicineHistory, QDistinct> distinctByCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cost');
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QDistinct> distinctByDosage(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dosage', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QDistinct> distinctByFarmID(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'farmID', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QDistinct>
      distinctByMedicineName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'medicineName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QDistinct> distinctByPigUuid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pigUuid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QDistinct>
      distinctByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quantity');
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QDistinct> distinctByStatus(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<MedicineHistory, MedicineHistory, QDistinct> distinctByUuid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uuid', caseSensitive: caseSensitive);
    });
  }
}

extension MedicineHistoryQueryProperty
    on QueryBuilder<MedicineHistory, MedicineHistory, QQueryProperty> {
  QueryBuilder<MedicineHistory, int, QQueryOperations> isarIDProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarID');
    });
  }

  QueryBuilder<MedicineHistory, double, QQueryOperations> costProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cost');
    });
  }

  QueryBuilder<MedicineHistory, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<MedicineHistory, String, QQueryOperations> dosageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dosage');
    });
  }

  QueryBuilder<MedicineHistory, String, QQueryOperations> farmIDProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'farmID');
    });
  }

  QueryBuilder<MedicineHistory, String, QQueryOperations>
      medicineNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'medicineName');
    });
  }

  QueryBuilder<MedicineHistory, String?, QQueryOperations> pigUuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pigUuid');
    });
  }

  QueryBuilder<MedicineHistory, int, QQueryOperations> quantityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quantity');
    });
  }

  QueryBuilder<MedicineHistory, String, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<MedicineHistory, DateTime, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<MedicineHistory, String, QQueryOperations> uuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uuid');
    });
  }
}

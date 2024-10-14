// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ledger.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetLedgerCollection on Isar {
  IsarCollection<Ledger> get ledgers => this.collection();
}

const LedgerSchema = CollectionSchema(
  name: r'Ledger',
  id: -676299692748655048,
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
    r'pigUuid': PropertySchema(
      id: 2,
      name: r'pigUuid',
      type: IsarType.string,
    ),
    r'priceSold': PropertySchema(
      id: 3,
      name: r'priceSold',
      type: IsarType.double,
    ),
    r'status': PropertySchema(
      id: 4,
      name: r'status',
      type: IsarType.string,
    ),
    r'transactionDate': PropertySchema(
      id: 5,
      name: r'transactionDate',
      type: IsarType.dateTime,
    ),
    r'updatedAt': PropertySchema(
      id: 6,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'userOwner': PropertySchema(
      id: 7,
      name: r'userOwner',
      type: IsarType.string,
    ),
    r'uuid': PropertySchema(
      id: 8,
      name: r'uuid',
      type: IsarType.string,
    ),
    r'weightKG': PropertySchema(
      id: 9,
      name: r'weightKG',
      type: IsarType.double,
    )
  },
  estimateSize: _ledgerEstimateSize,
  serialize: _ledgerSerialize,
  deserialize: _ledgerDeserialize,
  deserializeProp: _ledgerDeserializeProp,
  idName: r'isarID',
  indexes: {
    r'userOwner': IndexSchema(
      id: 1524401379560523256,
      name: r'userOwner',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'userOwner',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
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
  getId: _ledgerGetId,
  getLinks: _ledgerGetLinks,
  attach: _ledgerAttach,
  version: '3.1.0+1',
);

int _ledgerEstimateSize(
  Ledger object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.farmID.length * 3;
  bytesCount += 3 + object.pigUuid.length * 3;
  bytesCount += 3 + object.status.length * 3;
  {
    final value = object.userOwner;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.uuid.length * 3;
  return bytesCount;
}

void _ledgerSerialize(
  Ledger object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createdAt);
  writer.writeString(offsets[1], object.farmID);
  writer.writeString(offsets[2], object.pigUuid);
  writer.writeDouble(offsets[3], object.priceSold);
  writer.writeString(offsets[4], object.status);
  writer.writeDateTime(offsets[5], object.transactionDate);
  writer.writeDateTime(offsets[6], object.updatedAt);
  writer.writeString(offsets[7], object.userOwner);
  writer.writeString(offsets[8], object.uuid);
  writer.writeDouble(offsets[9], object.weightKG);
}

Ledger _ledgerDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Ledger();
  object.createdAt = reader.readDateTime(offsets[0]);
  object.farmID = reader.readString(offsets[1]);
  object.isarID = id;
  object.pigUuid = reader.readString(offsets[2]);
  object.priceSold = reader.readDoubleOrNull(offsets[3]);
  object.status = reader.readString(offsets[4]);
  object.transactionDate = reader.readDateTime(offsets[5]);
  object.updatedAt = reader.readDateTime(offsets[6]);
  object.userOwner = reader.readStringOrNull(offsets[7]);
  object.uuid = reader.readString(offsets[8]);
  object.weightKG = reader.readDoubleOrNull(offsets[9]);
  return object;
}

P _ledgerDeserializeProp<P>(
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
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readDoubleOrNull(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readDateTime(offset)) as P;
    case 6:
      return (reader.readDateTime(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readDoubleOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _ledgerGetId(Ledger object) {
  return object.isarID;
}

List<IsarLinkBase<dynamic>> _ledgerGetLinks(Ledger object) {
  return [];
}

void _ledgerAttach(IsarCollection<dynamic> col, Id id, Ledger object) {
  object.isarID = id;
}

extension LedgerQueryWhereSort on QueryBuilder<Ledger, Ledger, QWhere> {
  QueryBuilder<Ledger, Ledger, QAfterWhere> anyIsarID() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension LedgerQueryWhere on QueryBuilder<Ledger, Ledger, QWhereClause> {
  QueryBuilder<Ledger, Ledger, QAfterWhereClause> isarIDEqualTo(Id isarID) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarID,
        upper: isarID,
      ));
    });
  }

  QueryBuilder<Ledger, Ledger, QAfterWhereClause> isarIDNotEqualTo(Id isarID) {
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

  QueryBuilder<Ledger, Ledger, QAfterWhereClause> isarIDGreaterThan(Id isarID,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarID, includeLower: include),
      );
    });
  }

  QueryBuilder<Ledger, Ledger, QAfterWhereClause> isarIDLessThan(Id isarID,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarID, includeUpper: include),
      );
    });
  }

  QueryBuilder<Ledger, Ledger, QAfterWhereClause> isarIDBetween(
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

  QueryBuilder<Ledger, Ledger, QAfterWhereClause> userOwnerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'userOwner',
        value: [null],
      ));
    });
  }

  QueryBuilder<Ledger, Ledger, QAfterWhereClause> userOwnerIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'userOwner',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<Ledger, Ledger, QAfterWhereClause> userOwnerEqualTo(
      String? userOwner) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'userOwner',
        value: [userOwner],
      ));
    });
  }

  QueryBuilder<Ledger, Ledger, QAfterWhereClause> userOwnerNotEqualTo(
      String? userOwner) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userOwner',
              lower: [],
              upper: [userOwner],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userOwner',
              lower: [userOwner],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userOwner',
              lower: [userOwner],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userOwner',
              lower: [],
              upper: [userOwner],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Ledger, Ledger, QAfterWhereClause> uuidEqualTo(String uuid) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'uuid',
        value: [uuid],
      ));
    });
  }

  QueryBuilder<Ledger, Ledger, QAfterWhereClause> uuidNotEqualTo(String uuid) {
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

  QueryBuilder<Ledger, Ledger, QAfterWhereClause> pigUuidEqualTo(
      String pigUuid) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'pigUuid',
        value: [pigUuid],
      ));
    });
  }

  QueryBuilder<Ledger, Ledger, QAfterWhereClause> pigUuidNotEqualTo(
      String pigUuid) {
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

  QueryBuilder<Ledger, Ledger, QAfterWhereClause> farmIDEqualTo(String farmID) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'farmID',
        value: [farmID],
      ));
    });
  }

  QueryBuilder<Ledger, Ledger, QAfterWhereClause> farmIDNotEqualTo(
      String farmID) {
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

extension LedgerQueryFilter on QueryBuilder<Ledger, Ledger, QFilterCondition> {
  QueryBuilder<Ledger, Ledger, QAfterFilterCondition> createdAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Ledger, Ledger, QAfterFilterCondition> createdAtGreaterThan(
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

  QueryBuilder<Ledger, Ledger, QAfterFilterCondition> createdAtLessThan(
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

  QueryBuilder<Ledger, Ledger, QAfterFilterCondition> createdAtBetween(
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

  QueryBuilder<Ledger, Ledger, QAfterFilterCondition> farmIDEqualTo(
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

  QueryBuilder<Ledger, Ledger, QAfterFilterCondition> farmIDGreaterThan(
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

  QueryBuilder<Ledger, Ledger, QAfterFilterCondition> farmIDLessThan(
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

  QueryBuilder<Ledger, Ledger, QAfterFilterCondition> farmIDBetween(
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

  QueryBuilder<Ledger, Ledger, QAfterFilterCondition> farmIDStartsWith(
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

  QueryBuilder<Ledger, Ledger, QAfterFilterCondition> farmIDEndsWith(
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

  QueryBuilder<Ledger, Ledger, QAfterFilterCondition> farmIDContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'farmID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Ledger, Ledger, QAfterFilterCondition> farmIDMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'farmID',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Ledger, Ledger, QAfterFilterCondition> farmIDIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'farmID',
        value: '',
      ));
    });
  }

  QueryBuilder<Ledger, Ledger, QAfterFilterCondition> farmIDIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'farmID',
        value: '',
      ));
    });
  }

  QueryBuilder<Ledger, Ledger, QAfterFilterCondition> isarIDEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarID',
        value: value,
      ));
    });
  }

  QueryBuilder<Ledger, Ledger, QAfterFilterCondition> isarIDGreaterThan(
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

  QueryBuilder<Ledger, Ledger, QAfterFilterCondition> isarIDLessThan(
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

  QueryBuilder<Ledger, Ledger, QAfterFilterCondition> isarIDBetween(
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

  QueryBuilder<Ledger, Ledger, QAfterFilterCondition> pigUuidEqualTo(
    String value, {
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

  QueryBuilder<Ledger, Ledger, QAfterFilterCondition> pigUuidGreaterThan(
    String value, {
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

  QueryBuilder<Ledger, Ledger, QAfterFilterCondition> pigUuidLessThan(
    String value, {
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

  QueryBuilder<Ledger, Ledger, QAfterFilterCondition> pigUuidBetween(
    String lower,
    String upper, {
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

  QueryBuilder<Ledger, Ledger, QAfterFilterCondition> pigUuidStartsWith(
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

  QueryBuilder<Ledger, Ledger, QAfterFilterCondition> pigUuidEndsWith(
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

  QueryBuilder<Ledger, Ledger, QAfterFilterCondition> pigUuidContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'pigUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Ledger, Ledger, QAfterFilterCondition> pigUuidMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'pigUuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Ledger, Ledger, QAfterFilterCondition> pigUuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pigUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<Ledger, Ledger, QAfterFilterCondition> pigUuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'pigUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<Ledger, Ledger, QAfterFilterCondition> priceSoldIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'priceSold',
      ));
    });
  }

  QueryBuilder<Ledger, Ledger, QAfterFilterCondition> priceSoldIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'priceSold',
      ));
    });
  }

  QueryBuilder<Ledger, Ledger, QAfterFilterCondition> priceSoldEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'priceSold',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Ledger, Ledger, QAfterFilterCondition> priceSoldGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'priceSold',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Ledger, Ledger, QAfterFilterCondition> priceSoldLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'priceSold',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Ledger, Ledger, QAfterFilterCondition> priceSoldBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'priceSold',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Ledger, Ledger, QAfterFilterCondition> statusEqualTo(
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

  QueryBuilder<Ledger, Ledger, QAfterFilterCondition> statusGreaterThan(
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

  QueryBuilder<Ledger, Ledger, QAfterFilterCondition> statusLessThan(
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

  QueryBuilder<Ledger, Ledger, QAfterFilterCondition> statusBetween(
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

  QueryBuilder<Ledger, Ledger, QAfterFilterCondition> statusStartsWith(
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

  QueryBuilder<Ledger, Ledger, QAfterFilterCondition> statusEndsWith(
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

  QueryBuilder<Ledger, Ledger, QAfterFilterCondition> statusContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Ledger, Ledger, QAfterFilterCondition> statusMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'status',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Ledger, Ledger, QAfterFilterCondition> statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<Ledger, Ledger, QAfterFilterCondition> statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<Ledger, Ledger, QAfterFilterCondition> transactionDateEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'transactionDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Ledger, Ledger, QAfterFilterCondition>
      transactionDateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'transactionDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Ledger, Ledger, QAfterFilterCondition> transactionDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'transactionDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Ledger, Ledger, QAfterFilterCondition> transactionDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'transactionDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Ledger, Ledger, QAfterFilterCondition> updatedAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Ledger, Ledger, QAfterFilterCondition> updatedAtGreaterThan(
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

  QueryBuilder<Ledger, Ledger, QAfterFilterCondition> updatedAtLessThan(
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

  QueryBuilder<Ledger, Ledger, QAfterFilterCondition> updatedAtBetween(
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

  QueryBuilder<Ledger, Ledger, QAfterFilterCondition> userOwnerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'userOwner',
      ));
    });
  }

  QueryBuilder<Ledger, Ledger, QAfterFilterCondition> userOwnerIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'userOwner',
      ));
    });
  }

  QueryBuilder<Ledger, Ledger, QAfterFilterCondition> userOwnerEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userOwner',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Ledger, Ledger, QAfterFilterCondition> userOwnerGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userOwner',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Ledger, Ledger, QAfterFilterCondition> userOwnerLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userOwner',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Ledger, Ledger, QAfterFilterCondition> userOwnerBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userOwner',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Ledger, Ledger, QAfterFilterCondition> userOwnerStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'userOwner',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Ledger, Ledger, QAfterFilterCondition> userOwnerEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'userOwner',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Ledger, Ledger, QAfterFilterCondition> userOwnerContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userOwner',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Ledger, Ledger, QAfterFilterCondition> userOwnerMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userOwner',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Ledger, Ledger, QAfterFilterCondition> userOwnerIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userOwner',
        value: '',
      ));
    });
  }

  QueryBuilder<Ledger, Ledger, QAfterFilterCondition> userOwnerIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userOwner',
        value: '',
      ));
    });
  }

  QueryBuilder<Ledger, Ledger, QAfterFilterCondition> uuidEqualTo(
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

  QueryBuilder<Ledger, Ledger, QAfterFilterCondition> uuidGreaterThan(
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

  QueryBuilder<Ledger, Ledger, QAfterFilterCondition> uuidLessThan(
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

  QueryBuilder<Ledger, Ledger, QAfterFilterCondition> uuidBetween(
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

  QueryBuilder<Ledger, Ledger, QAfterFilterCondition> uuidStartsWith(
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

  QueryBuilder<Ledger, Ledger, QAfterFilterCondition> uuidEndsWith(
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

  QueryBuilder<Ledger, Ledger, QAfterFilterCondition> uuidContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Ledger, Ledger, QAfterFilterCondition> uuidMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'uuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Ledger, Ledger, QAfterFilterCondition> uuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uuid',
        value: '',
      ));
    });
  }

  QueryBuilder<Ledger, Ledger, QAfterFilterCondition> uuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'uuid',
        value: '',
      ));
    });
  }

  QueryBuilder<Ledger, Ledger, QAfterFilterCondition> weightKGIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'weightKG',
      ));
    });
  }

  QueryBuilder<Ledger, Ledger, QAfterFilterCondition> weightKGIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'weightKG',
      ));
    });
  }

  QueryBuilder<Ledger, Ledger, QAfterFilterCondition> weightKGEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'weightKG',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Ledger, Ledger, QAfterFilterCondition> weightKGGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'weightKG',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Ledger, Ledger, QAfterFilterCondition> weightKGLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'weightKG',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Ledger, Ledger, QAfterFilterCondition> weightKGBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'weightKG',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension LedgerQueryObject on QueryBuilder<Ledger, Ledger, QFilterCondition> {}

extension LedgerQueryLinks on QueryBuilder<Ledger, Ledger, QFilterCondition> {}

extension LedgerQuerySortBy on QueryBuilder<Ledger, Ledger, QSortBy> {
  QueryBuilder<Ledger, Ledger, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<Ledger, Ledger, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<Ledger, Ledger, QAfterSortBy> sortByFarmID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmID', Sort.asc);
    });
  }

  QueryBuilder<Ledger, Ledger, QAfterSortBy> sortByFarmIDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmID', Sort.desc);
    });
  }

  QueryBuilder<Ledger, Ledger, QAfterSortBy> sortByPigUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pigUuid', Sort.asc);
    });
  }

  QueryBuilder<Ledger, Ledger, QAfterSortBy> sortByPigUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pigUuid', Sort.desc);
    });
  }

  QueryBuilder<Ledger, Ledger, QAfterSortBy> sortByPriceSold() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priceSold', Sort.asc);
    });
  }

  QueryBuilder<Ledger, Ledger, QAfterSortBy> sortByPriceSoldDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priceSold', Sort.desc);
    });
  }

  QueryBuilder<Ledger, Ledger, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<Ledger, Ledger, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<Ledger, Ledger, QAfterSortBy> sortByTransactionDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionDate', Sort.asc);
    });
  }

  QueryBuilder<Ledger, Ledger, QAfterSortBy> sortByTransactionDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionDate', Sort.desc);
    });
  }

  QueryBuilder<Ledger, Ledger, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<Ledger, Ledger, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<Ledger, Ledger, QAfterSortBy> sortByUserOwner() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userOwner', Sort.asc);
    });
  }

  QueryBuilder<Ledger, Ledger, QAfterSortBy> sortByUserOwnerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userOwner', Sort.desc);
    });
  }

  QueryBuilder<Ledger, Ledger, QAfterSortBy> sortByUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.asc);
    });
  }

  QueryBuilder<Ledger, Ledger, QAfterSortBy> sortByUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.desc);
    });
  }

  QueryBuilder<Ledger, Ledger, QAfterSortBy> sortByWeightKG() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weightKG', Sort.asc);
    });
  }

  QueryBuilder<Ledger, Ledger, QAfterSortBy> sortByWeightKGDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weightKG', Sort.desc);
    });
  }
}

extension LedgerQuerySortThenBy on QueryBuilder<Ledger, Ledger, QSortThenBy> {
  QueryBuilder<Ledger, Ledger, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<Ledger, Ledger, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<Ledger, Ledger, QAfterSortBy> thenByFarmID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmID', Sort.asc);
    });
  }

  QueryBuilder<Ledger, Ledger, QAfterSortBy> thenByFarmIDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmID', Sort.desc);
    });
  }

  QueryBuilder<Ledger, Ledger, QAfterSortBy> thenByIsarID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarID', Sort.asc);
    });
  }

  QueryBuilder<Ledger, Ledger, QAfterSortBy> thenByIsarIDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarID', Sort.desc);
    });
  }

  QueryBuilder<Ledger, Ledger, QAfterSortBy> thenByPigUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pigUuid', Sort.asc);
    });
  }

  QueryBuilder<Ledger, Ledger, QAfterSortBy> thenByPigUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pigUuid', Sort.desc);
    });
  }

  QueryBuilder<Ledger, Ledger, QAfterSortBy> thenByPriceSold() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priceSold', Sort.asc);
    });
  }

  QueryBuilder<Ledger, Ledger, QAfterSortBy> thenByPriceSoldDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priceSold', Sort.desc);
    });
  }

  QueryBuilder<Ledger, Ledger, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<Ledger, Ledger, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<Ledger, Ledger, QAfterSortBy> thenByTransactionDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionDate', Sort.asc);
    });
  }

  QueryBuilder<Ledger, Ledger, QAfterSortBy> thenByTransactionDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionDate', Sort.desc);
    });
  }

  QueryBuilder<Ledger, Ledger, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<Ledger, Ledger, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<Ledger, Ledger, QAfterSortBy> thenByUserOwner() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userOwner', Sort.asc);
    });
  }

  QueryBuilder<Ledger, Ledger, QAfterSortBy> thenByUserOwnerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userOwner', Sort.desc);
    });
  }

  QueryBuilder<Ledger, Ledger, QAfterSortBy> thenByUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.asc);
    });
  }

  QueryBuilder<Ledger, Ledger, QAfterSortBy> thenByUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.desc);
    });
  }

  QueryBuilder<Ledger, Ledger, QAfterSortBy> thenByWeightKG() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weightKG', Sort.asc);
    });
  }

  QueryBuilder<Ledger, Ledger, QAfterSortBy> thenByWeightKGDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weightKG', Sort.desc);
    });
  }
}

extension LedgerQueryWhereDistinct on QueryBuilder<Ledger, Ledger, QDistinct> {
  QueryBuilder<Ledger, Ledger, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<Ledger, Ledger, QDistinct> distinctByFarmID(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'farmID', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Ledger, Ledger, QDistinct> distinctByPigUuid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pigUuid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Ledger, Ledger, QDistinct> distinctByPriceSold() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'priceSold');
    });
  }

  QueryBuilder<Ledger, Ledger, QDistinct> distinctByStatus(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Ledger, Ledger, QDistinct> distinctByTransactionDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'transactionDate');
    });
  }

  QueryBuilder<Ledger, Ledger, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<Ledger, Ledger, QDistinct> distinctByUserOwner(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userOwner', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Ledger, Ledger, QDistinct> distinctByUuid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uuid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Ledger, Ledger, QDistinct> distinctByWeightKG() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'weightKG');
    });
  }
}

extension LedgerQueryProperty on QueryBuilder<Ledger, Ledger, QQueryProperty> {
  QueryBuilder<Ledger, int, QQueryOperations> isarIDProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarID');
    });
  }

  QueryBuilder<Ledger, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<Ledger, String, QQueryOperations> farmIDProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'farmID');
    });
  }

  QueryBuilder<Ledger, String, QQueryOperations> pigUuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pigUuid');
    });
  }

  QueryBuilder<Ledger, double?, QQueryOperations> priceSoldProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'priceSold');
    });
  }

  QueryBuilder<Ledger, String, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<Ledger, DateTime, QQueryOperations> transactionDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'transactionDate');
    });
  }

  QueryBuilder<Ledger, DateTime, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<Ledger, String?, QQueryOperations> userOwnerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userOwner');
    });
  }

  QueryBuilder<Ledger, String, QQueryOperations> uuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uuid');
    });
  }

  QueryBuilder<Ledger, double?, QQueryOperations> weightKGProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'weightKG');
    });
  }
}

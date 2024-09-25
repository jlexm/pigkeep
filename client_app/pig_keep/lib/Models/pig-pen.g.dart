// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pig-pen.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPigPenCollection on Isar {
  IsarCollection<PigPen> get pigPens => this.collection();
}

const PigPenSchema = CollectionSchema(
  name: r'PigPen',
  id: 1925787571898968314,
  properties: {
    r'createdAt': PropertySchema(
      id: 0,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'currentPigCount': PropertySchema(
      id: 1,
      name: r'currentPigCount',
      type: IsarType.long,
    ),
    r'farmID': PropertySchema(
      id: 2,
      name: r'farmID',
      type: IsarType.string,
    ),
    r'maxPigCount': PropertySchema(
      id: 3,
      name: r'maxPigCount',
      type: IsarType.long,
    ),
    r'penNumber': PropertySchema(
      id: 4,
      name: r'penNumber',
      type: IsarType.string,
    ),
    r'penType': PropertySchema(
      id: 5,
      name: r'penType',
      type: IsarType.string,
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
    )
  },
  estimateSize: _pigPenEstimateSize,
  serialize: _pigPenSerialize,
  deserialize: _pigPenDeserialize,
  deserializeProp: _pigPenDeserializeProp,
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
    r'penNumber': IndexSchema(
      id: -6834099470084102191,
      name: r'penNumber',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'penNumber',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'penType': IndexSchema(
      id: -730183763839389883,
      name: r'penType',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'penType',
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
  getId: _pigPenGetId,
  getLinks: _pigPenGetLinks,
  attach: _pigPenAttach,
  version: '3.1.0+1',
);

int _pigPenEstimateSize(
  PigPen object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.farmID.length * 3;
  bytesCount += 3 + object.penNumber.length * 3;
  bytesCount += 3 + object.penType.length * 3;
  {
    final value = object.userOwner;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.uuid.length * 3;
  return bytesCount;
}

void _pigPenSerialize(
  PigPen object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createdAt);
  writer.writeLong(offsets[1], object.currentPigCount);
  writer.writeString(offsets[2], object.farmID);
  writer.writeLong(offsets[3], object.maxPigCount);
  writer.writeString(offsets[4], object.penNumber);
  writer.writeString(offsets[5], object.penType);
  writer.writeDateTime(offsets[6], object.updatedAt);
  writer.writeString(offsets[7], object.userOwner);
  writer.writeString(offsets[8], object.uuid);
}

PigPen _pigPenDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PigPen();
  object.createdAt = reader.readDateTime(offsets[0]);
  object.currentPigCount = reader.readLong(offsets[1]);
  object.farmID = reader.readString(offsets[2]);
  object.isarID = id;
  object.maxPigCount = reader.readLong(offsets[3]);
  object.penNumber = reader.readString(offsets[4]);
  object.penType = reader.readString(offsets[5]);
  object.updatedAt = reader.readDateTime(offsets[6]);
  object.userOwner = reader.readStringOrNull(offsets[7]);
  object.uuid = reader.readString(offsets[8]);
  return object;
}

P _pigPenDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readDateTime(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _pigPenGetId(PigPen object) {
  return object.isarID;
}

List<IsarLinkBase<dynamic>> _pigPenGetLinks(PigPen object) {
  return [];
}

void _pigPenAttach(IsarCollection<dynamic> col, Id id, PigPen object) {
  object.isarID = id;
}

extension PigPenQueryWhereSort on QueryBuilder<PigPen, PigPen, QWhere> {
  QueryBuilder<PigPen, PigPen, QAfterWhere> anyIsarID() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PigPenQueryWhere on QueryBuilder<PigPen, PigPen, QWhereClause> {
  QueryBuilder<PigPen, PigPen, QAfterWhereClause> isarIDEqualTo(Id isarID) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarID,
        upper: isarID,
      ));
    });
  }

  QueryBuilder<PigPen, PigPen, QAfterWhereClause> isarIDNotEqualTo(Id isarID) {
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

  QueryBuilder<PigPen, PigPen, QAfterWhereClause> isarIDGreaterThan(Id isarID,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarID, includeLower: include),
      );
    });
  }

  QueryBuilder<PigPen, PigPen, QAfterWhereClause> isarIDLessThan(Id isarID,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarID, includeUpper: include),
      );
    });
  }

  QueryBuilder<PigPen, PigPen, QAfterWhereClause> isarIDBetween(
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

  QueryBuilder<PigPen, PigPen, QAfterWhereClause> userOwnerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'userOwner',
        value: [null],
      ));
    });
  }

  QueryBuilder<PigPen, PigPen, QAfterWhereClause> userOwnerIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'userOwner',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<PigPen, PigPen, QAfterWhereClause> userOwnerEqualTo(
      String? userOwner) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'userOwner',
        value: [userOwner],
      ));
    });
  }

  QueryBuilder<PigPen, PigPen, QAfterWhereClause> userOwnerNotEqualTo(
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

  QueryBuilder<PigPen, PigPen, QAfterWhereClause> uuidEqualTo(String uuid) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'uuid',
        value: [uuid],
      ));
    });
  }

  QueryBuilder<PigPen, PigPen, QAfterWhereClause> uuidNotEqualTo(String uuid) {
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

  QueryBuilder<PigPen, PigPen, QAfterWhereClause> penNumberEqualTo(
      String penNumber) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'penNumber',
        value: [penNumber],
      ));
    });
  }

  QueryBuilder<PigPen, PigPen, QAfterWhereClause> penNumberNotEqualTo(
      String penNumber) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'penNumber',
              lower: [],
              upper: [penNumber],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'penNumber',
              lower: [penNumber],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'penNumber',
              lower: [penNumber],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'penNumber',
              lower: [],
              upper: [penNumber],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<PigPen, PigPen, QAfterWhereClause> penTypeEqualTo(
      String penType) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'penType',
        value: [penType],
      ));
    });
  }

  QueryBuilder<PigPen, PigPen, QAfterWhereClause> penTypeNotEqualTo(
      String penType) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'penType',
              lower: [],
              upper: [penType],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'penType',
              lower: [penType],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'penType',
              lower: [penType],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'penType',
              lower: [],
              upper: [penType],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<PigPen, PigPen, QAfterWhereClause> farmIDEqualTo(String farmID) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'farmID',
        value: [farmID],
      ));
    });
  }

  QueryBuilder<PigPen, PigPen, QAfterWhereClause> farmIDNotEqualTo(
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

extension PigPenQueryFilter on QueryBuilder<PigPen, PigPen, QFilterCondition> {
  QueryBuilder<PigPen, PigPen, QAfterFilterCondition> createdAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<PigPen, PigPen, QAfterFilterCondition> createdAtGreaterThan(
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

  QueryBuilder<PigPen, PigPen, QAfterFilterCondition> createdAtLessThan(
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

  QueryBuilder<PigPen, PigPen, QAfterFilterCondition> createdAtBetween(
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

  QueryBuilder<PigPen, PigPen, QAfterFilterCondition> currentPigCountEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currentPigCount',
        value: value,
      ));
    });
  }

  QueryBuilder<PigPen, PigPen, QAfterFilterCondition>
      currentPigCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'currentPigCount',
        value: value,
      ));
    });
  }

  QueryBuilder<PigPen, PigPen, QAfterFilterCondition> currentPigCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'currentPigCount',
        value: value,
      ));
    });
  }

  QueryBuilder<PigPen, PigPen, QAfterFilterCondition> currentPigCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'currentPigCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PigPen, PigPen, QAfterFilterCondition> farmIDEqualTo(
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

  QueryBuilder<PigPen, PigPen, QAfterFilterCondition> farmIDGreaterThan(
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

  QueryBuilder<PigPen, PigPen, QAfterFilterCondition> farmIDLessThan(
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

  QueryBuilder<PigPen, PigPen, QAfterFilterCondition> farmIDBetween(
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

  QueryBuilder<PigPen, PigPen, QAfterFilterCondition> farmIDStartsWith(
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

  QueryBuilder<PigPen, PigPen, QAfterFilterCondition> farmIDEndsWith(
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

  QueryBuilder<PigPen, PigPen, QAfterFilterCondition> farmIDContains(
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

  QueryBuilder<PigPen, PigPen, QAfterFilterCondition> farmIDMatches(
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

  QueryBuilder<PigPen, PigPen, QAfterFilterCondition> farmIDIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'farmID',
        value: '',
      ));
    });
  }

  QueryBuilder<PigPen, PigPen, QAfterFilterCondition> farmIDIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'farmID',
        value: '',
      ));
    });
  }

  QueryBuilder<PigPen, PigPen, QAfterFilterCondition> isarIDEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarID',
        value: value,
      ));
    });
  }

  QueryBuilder<PigPen, PigPen, QAfterFilterCondition> isarIDGreaterThan(
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

  QueryBuilder<PigPen, PigPen, QAfterFilterCondition> isarIDLessThan(
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

  QueryBuilder<PigPen, PigPen, QAfterFilterCondition> isarIDBetween(
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

  QueryBuilder<PigPen, PigPen, QAfterFilterCondition> maxPigCountEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maxPigCount',
        value: value,
      ));
    });
  }

  QueryBuilder<PigPen, PigPen, QAfterFilterCondition> maxPigCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'maxPigCount',
        value: value,
      ));
    });
  }

  QueryBuilder<PigPen, PigPen, QAfterFilterCondition> maxPigCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'maxPigCount',
        value: value,
      ));
    });
  }

  QueryBuilder<PigPen, PigPen, QAfterFilterCondition> maxPigCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'maxPigCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PigPen, PigPen, QAfterFilterCondition> penNumberEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'penNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PigPen, PigPen, QAfterFilterCondition> penNumberGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'penNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PigPen, PigPen, QAfterFilterCondition> penNumberLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'penNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PigPen, PigPen, QAfterFilterCondition> penNumberBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'penNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PigPen, PigPen, QAfterFilterCondition> penNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'penNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PigPen, PigPen, QAfterFilterCondition> penNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'penNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PigPen, PigPen, QAfterFilterCondition> penNumberContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'penNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PigPen, PigPen, QAfterFilterCondition> penNumberMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'penNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PigPen, PigPen, QAfterFilterCondition> penNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'penNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<PigPen, PigPen, QAfterFilterCondition> penNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'penNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<PigPen, PigPen, QAfterFilterCondition> penTypeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'penType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PigPen, PigPen, QAfterFilterCondition> penTypeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'penType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PigPen, PigPen, QAfterFilterCondition> penTypeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'penType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PigPen, PigPen, QAfterFilterCondition> penTypeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'penType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PigPen, PigPen, QAfterFilterCondition> penTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'penType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PigPen, PigPen, QAfterFilterCondition> penTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'penType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PigPen, PigPen, QAfterFilterCondition> penTypeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'penType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PigPen, PigPen, QAfterFilterCondition> penTypeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'penType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PigPen, PigPen, QAfterFilterCondition> penTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'penType',
        value: '',
      ));
    });
  }

  QueryBuilder<PigPen, PigPen, QAfterFilterCondition> penTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'penType',
        value: '',
      ));
    });
  }

  QueryBuilder<PigPen, PigPen, QAfterFilterCondition> updatedAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<PigPen, PigPen, QAfterFilterCondition> updatedAtGreaterThan(
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

  QueryBuilder<PigPen, PigPen, QAfterFilterCondition> updatedAtLessThan(
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

  QueryBuilder<PigPen, PigPen, QAfterFilterCondition> updatedAtBetween(
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

  QueryBuilder<PigPen, PigPen, QAfterFilterCondition> userOwnerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'userOwner',
      ));
    });
  }

  QueryBuilder<PigPen, PigPen, QAfterFilterCondition> userOwnerIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'userOwner',
      ));
    });
  }

  QueryBuilder<PigPen, PigPen, QAfterFilterCondition> userOwnerEqualTo(
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

  QueryBuilder<PigPen, PigPen, QAfterFilterCondition> userOwnerGreaterThan(
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

  QueryBuilder<PigPen, PigPen, QAfterFilterCondition> userOwnerLessThan(
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

  QueryBuilder<PigPen, PigPen, QAfterFilterCondition> userOwnerBetween(
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

  QueryBuilder<PigPen, PigPen, QAfterFilterCondition> userOwnerStartsWith(
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

  QueryBuilder<PigPen, PigPen, QAfterFilterCondition> userOwnerEndsWith(
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

  QueryBuilder<PigPen, PigPen, QAfterFilterCondition> userOwnerContains(
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

  QueryBuilder<PigPen, PigPen, QAfterFilterCondition> userOwnerMatches(
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

  QueryBuilder<PigPen, PigPen, QAfterFilterCondition> userOwnerIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userOwner',
        value: '',
      ));
    });
  }

  QueryBuilder<PigPen, PigPen, QAfterFilterCondition> userOwnerIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userOwner',
        value: '',
      ));
    });
  }

  QueryBuilder<PigPen, PigPen, QAfterFilterCondition> uuidEqualTo(
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

  QueryBuilder<PigPen, PigPen, QAfterFilterCondition> uuidGreaterThan(
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

  QueryBuilder<PigPen, PigPen, QAfterFilterCondition> uuidLessThan(
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

  QueryBuilder<PigPen, PigPen, QAfterFilterCondition> uuidBetween(
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

  QueryBuilder<PigPen, PigPen, QAfterFilterCondition> uuidStartsWith(
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

  QueryBuilder<PigPen, PigPen, QAfterFilterCondition> uuidEndsWith(
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

  QueryBuilder<PigPen, PigPen, QAfterFilterCondition> uuidContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PigPen, PigPen, QAfterFilterCondition> uuidMatches(
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

  QueryBuilder<PigPen, PigPen, QAfterFilterCondition> uuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uuid',
        value: '',
      ));
    });
  }

  QueryBuilder<PigPen, PigPen, QAfterFilterCondition> uuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'uuid',
        value: '',
      ));
    });
  }
}

extension PigPenQueryObject on QueryBuilder<PigPen, PigPen, QFilterCondition> {}

extension PigPenQueryLinks on QueryBuilder<PigPen, PigPen, QFilterCondition> {}

extension PigPenQuerySortBy on QueryBuilder<PigPen, PigPen, QSortBy> {
  QueryBuilder<PigPen, PigPen, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<PigPen, PigPen, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<PigPen, PigPen, QAfterSortBy> sortByCurrentPigCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentPigCount', Sort.asc);
    });
  }

  QueryBuilder<PigPen, PigPen, QAfterSortBy> sortByCurrentPigCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentPigCount', Sort.desc);
    });
  }

  QueryBuilder<PigPen, PigPen, QAfterSortBy> sortByFarmID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmID', Sort.asc);
    });
  }

  QueryBuilder<PigPen, PigPen, QAfterSortBy> sortByFarmIDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmID', Sort.desc);
    });
  }

  QueryBuilder<PigPen, PigPen, QAfterSortBy> sortByMaxPigCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxPigCount', Sort.asc);
    });
  }

  QueryBuilder<PigPen, PigPen, QAfterSortBy> sortByMaxPigCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxPigCount', Sort.desc);
    });
  }

  QueryBuilder<PigPen, PigPen, QAfterSortBy> sortByPenNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'penNumber', Sort.asc);
    });
  }

  QueryBuilder<PigPen, PigPen, QAfterSortBy> sortByPenNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'penNumber', Sort.desc);
    });
  }

  QueryBuilder<PigPen, PigPen, QAfterSortBy> sortByPenType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'penType', Sort.asc);
    });
  }

  QueryBuilder<PigPen, PigPen, QAfterSortBy> sortByPenTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'penType', Sort.desc);
    });
  }

  QueryBuilder<PigPen, PigPen, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<PigPen, PigPen, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<PigPen, PigPen, QAfterSortBy> sortByUserOwner() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userOwner', Sort.asc);
    });
  }

  QueryBuilder<PigPen, PigPen, QAfterSortBy> sortByUserOwnerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userOwner', Sort.desc);
    });
  }

  QueryBuilder<PigPen, PigPen, QAfterSortBy> sortByUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.asc);
    });
  }

  QueryBuilder<PigPen, PigPen, QAfterSortBy> sortByUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.desc);
    });
  }
}

extension PigPenQuerySortThenBy on QueryBuilder<PigPen, PigPen, QSortThenBy> {
  QueryBuilder<PigPen, PigPen, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<PigPen, PigPen, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<PigPen, PigPen, QAfterSortBy> thenByCurrentPigCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentPigCount', Sort.asc);
    });
  }

  QueryBuilder<PigPen, PigPen, QAfterSortBy> thenByCurrentPigCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentPigCount', Sort.desc);
    });
  }

  QueryBuilder<PigPen, PigPen, QAfterSortBy> thenByFarmID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmID', Sort.asc);
    });
  }

  QueryBuilder<PigPen, PigPen, QAfterSortBy> thenByFarmIDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmID', Sort.desc);
    });
  }

  QueryBuilder<PigPen, PigPen, QAfterSortBy> thenByIsarID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarID', Sort.asc);
    });
  }

  QueryBuilder<PigPen, PigPen, QAfterSortBy> thenByIsarIDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarID', Sort.desc);
    });
  }

  QueryBuilder<PigPen, PigPen, QAfterSortBy> thenByMaxPigCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxPigCount', Sort.asc);
    });
  }

  QueryBuilder<PigPen, PigPen, QAfterSortBy> thenByMaxPigCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxPigCount', Sort.desc);
    });
  }

  QueryBuilder<PigPen, PigPen, QAfterSortBy> thenByPenNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'penNumber', Sort.asc);
    });
  }

  QueryBuilder<PigPen, PigPen, QAfterSortBy> thenByPenNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'penNumber', Sort.desc);
    });
  }

  QueryBuilder<PigPen, PigPen, QAfterSortBy> thenByPenType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'penType', Sort.asc);
    });
  }

  QueryBuilder<PigPen, PigPen, QAfterSortBy> thenByPenTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'penType', Sort.desc);
    });
  }

  QueryBuilder<PigPen, PigPen, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<PigPen, PigPen, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<PigPen, PigPen, QAfterSortBy> thenByUserOwner() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userOwner', Sort.asc);
    });
  }

  QueryBuilder<PigPen, PigPen, QAfterSortBy> thenByUserOwnerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userOwner', Sort.desc);
    });
  }

  QueryBuilder<PigPen, PigPen, QAfterSortBy> thenByUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.asc);
    });
  }

  QueryBuilder<PigPen, PigPen, QAfterSortBy> thenByUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.desc);
    });
  }
}

extension PigPenQueryWhereDistinct on QueryBuilder<PigPen, PigPen, QDistinct> {
  QueryBuilder<PigPen, PigPen, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<PigPen, PigPen, QDistinct> distinctByCurrentPigCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'currentPigCount');
    });
  }

  QueryBuilder<PigPen, PigPen, QDistinct> distinctByFarmID(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'farmID', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PigPen, PigPen, QDistinct> distinctByMaxPigCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'maxPigCount');
    });
  }

  QueryBuilder<PigPen, PigPen, QDistinct> distinctByPenNumber(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'penNumber', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PigPen, PigPen, QDistinct> distinctByPenType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'penType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PigPen, PigPen, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<PigPen, PigPen, QDistinct> distinctByUserOwner(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userOwner', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PigPen, PigPen, QDistinct> distinctByUuid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uuid', caseSensitive: caseSensitive);
    });
  }
}

extension PigPenQueryProperty on QueryBuilder<PigPen, PigPen, QQueryProperty> {
  QueryBuilder<PigPen, int, QQueryOperations> isarIDProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarID');
    });
  }

  QueryBuilder<PigPen, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<PigPen, int, QQueryOperations> currentPigCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currentPigCount');
    });
  }

  QueryBuilder<PigPen, String, QQueryOperations> farmIDProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'farmID');
    });
  }

  QueryBuilder<PigPen, int, QQueryOperations> maxPigCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'maxPigCount');
    });
  }

  QueryBuilder<PigPen, String, QQueryOperations> penNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'penNumber');
    });
  }

  QueryBuilder<PigPen, String, QQueryOperations> penTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'penType');
    });
  }

  QueryBuilder<PigPen, DateTime, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<PigPen, String?, QQueryOperations> userOwnerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userOwner');
    });
  }

  QueryBuilder<PigPen, String, QQueryOperations> uuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uuid');
    });
  }
}

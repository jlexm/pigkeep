// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'farm.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetFarmCollection on Isar {
  IsarCollection<Farm> get farms => this.collection();
}

const FarmSchema = CollectionSchema(
  name: r'Farm',
  id: 7630401844282329995,
  properties: {
    r'createdAt': PropertySchema(
      id: 0,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'farmAddress': PropertySchema(
      id: 1,
      name: r'farmAddress',
      type: IsarType.string,
    ),
    r'farmName': PropertySchema(
      id: 2,
      name: r'farmName',
      type: IsarType.string,
    ),
    r'ownerID': PropertySchema(
      id: 3,
      name: r'ownerID',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 4,
      name: r'updatedAt',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _farmEstimateSize,
  serialize: _farmSerialize,
  deserialize: _farmDeserialize,
  deserializeProp: _farmDeserializeProp,
  idName: r'isarID',
  indexes: {
    r'farmName': IndexSchema(
      id: -5793381484996161363,
      name: r'farmName',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'farmName',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'ownerID': IndexSchema(
      id: 1729150171859769291,
      name: r'ownerID',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'ownerID',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _farmGetId,
  getLinks: _farmGetLinks,
  attach: _farmAttach,
  version: '3.1.0+1',
);

int _farmEstimateSize(
  Farm object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.farmAddress.length * 3;
  bytesCount += 3 + object.farmName.length * 3;
  bytesCount += 3 + object.ownerID.length * 3;
  return bytesCount;
}

void _farmSerialize(
  Farm object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createdAt);
  writer.writeString(offsets[1], object.farmAddress);
  writer.writeString(offsets[2], object.farmName);
  writer.writeString(offsets[3], object.ownerID);
  writer.writeDateTime(offsets[4], object.updatedAt);
}

Farm _farmDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Farm();
  object.createdAt = reader.readDateTime(offsets[0]);
  object.farmAddress = reader.readString(offsets[1]);
  object.farmName = reader.readString(offsets[2]);
  object.isarID = id;
  object.ownerID = reader.readString(offsets[3]);
  object.updatedAt = reader.readDateTime(offsets[4]);
  return object;
}

P _farmDeserializeProp<P>(
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
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _farmGetId(Farm object) {
  return object.isarID;
}

List<IsarLinkBase<dynamic>> _farmGetLinks(Farm object) {
  return [];
}

void _farmAttach(IsarCollection<dynamic> col, Id id, Farm object) {
  object.isarID = id;
}

extension FarmQueryWhereSort on QueryBuilder<Farm, Farm, QWhere> {
  QueryBuilder<Farm, Farm, QAfterWhere> anyIsarID() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension FarmQueryWhere on QueryBuilder<Farm, Farm, QWhereClause> {
  QueryBuilder<Farm, Farm, QAfterWhereClause> isarIDEqualTo(Id isarID) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarID,
        upper: isarID,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterWhereClause> isarIDNotEqualTo(Id isarID) {
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

  QueryBuilder<Farm, Farm, QAfterWhereClause> isarIDGreaterThan(Id isarID,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarID, includeLower: include),
      );
    });
  }

  QueryBuilder<Farm, Farm, QAfterWhereClause> isarIDLessThan(Id isarID,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarID, includeUpper: include),
      );
    });
  }

  QueryBuilder<Farm, Farm, QAfterWhereClause> isarIDBetween(
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

  QueryBuilder<Farm, Farm, QAfterWhereClause> farmNameEqualTo(String farmName) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'farmName',
        value: [farmName],
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterWhereClause> farmNameNotEqualTo(
      String farmName) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'farmName',
              lower: [],
              upper: [farmName],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'farmName',
              lower: [farmName],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'farmName',
              lower: [farmName],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'farmName',
              lower: [],
              upper: [farmName],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Farm, Farm, QAfterWhereClause> ownerIDEqualTo(String ownerID) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'ownerID',
        value: [ownerID],
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterWhereClause> ownerIDNotEqualTo(
      String ownerID) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'ownerID',
              lower: [],
              upper: [ownerID],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'ownerID',
              lower: [ownerID],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'ownerID',
              lower: [ownerID],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'ownerID',
              lower: [],
              upper: [ownerID],
              includeUpper: false,
            ));
      }
    });
  }
}

extension FarmQueryFilter on QueryBuilder<Farm, Farm, QFilterCondition> {
  QueryBuilder<Farm, Farm, QAfterFilterCondition> createdAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> createdAtGreaterThan(
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

  QueryBuilder<Farm, Farm, QAfterFilterCondition> createdAtLessThan(
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

  QueryBuilder<Farm, Farm, QAfterFilterCondition> createdAtBetween(
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

  QueryBuilder<Farm, Farm, QAfterFilterCondition> farmAddressEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'farmAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> farmAddressGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'farmAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> farmAddressLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'farmAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> farmAddressBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'farmAddress',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> farmAddressStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'farmAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> farmAddressEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'farmAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> farmAddressContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'farmAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> farmAddressMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'farmAddress',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> farmAddressIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'farmAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> farmAddressIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'farmAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> farmNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'farmName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> farmNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'farmName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> farmNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'farmName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> farmNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'farmName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> farmNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'farmName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> farmNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'farmName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> farmNameContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'farmName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> farmNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'farmName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> farmNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'farmName',
        value: '',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> farmNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'farmName',
        value: '',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> isarIDEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarID',
        value: value,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> isarIDGreaterThan(
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

  QueryBuilder<Farm, Farm, QAfterFilterCondition> isarIDLessThan(
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

  QueryBuilder<Farm, Farm, QAfterFilterCondition> isarIDBetween(
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

  QueryBuilder<Farm, Farm, QAfterFilterCondition> ownerIDEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ownerID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> ownerIDGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ownerID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> ownerIDLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ownerID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> ownerIDBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ownerID',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> ownerIDStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ownerID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> ownerIDEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ownerID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> ownerIDContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ownerID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> ownerIDMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ownerID',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> ownerIDIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ownerID',
        value: '',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> ownerIDIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ownerID',
        value: '',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> updatedAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> updatedAtGreaterThan(
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

  QueryBuilder<Farm, Farm, QAfterFilterCondition> updatedAtLessThan(
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

  QueryBuilder<Farm, Farm, QAfterFilterCondition> updatedAtBetween(
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

extension FarmQueryObject on QueryBuilder<Farm, Farm, QFilterCondition> {}

extension FarmQueryLinks on QueryBuilder<Farm, Farm, QFilterCondition> {}

extension FarmQuerySortBy on QueryBuilder<Farm, Farm, QSortBy> {
  QueryBuilder<Farm, Farm, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> sortByFarmAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmAddress', Sort.asc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> sortByFarmAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmAddress', Sort.desc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> sortByFarmName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmName', Sort.asc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> sortByFarmNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmName', Sort.desc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> sortByOwnerID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ownerID', Sort.asc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> sortByOwnerIDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ownerID', Sort.desc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension FarmQuerySortThenBy on QueryBuilder<Farm, Farm, QSortThenBy> {
  QueryBuilder<Farm, Farm, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> thenByFarmAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmAddress', Sort.asc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> thenByFarmAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmAddress', Sort.desc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> thenByFarmName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmName', Sort.asc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> thenByFarmNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmName', Sort.desc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> thenByIsarID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarID', Sort.asc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> thenByIsarIDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarID', Sort.desc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> thenByOwnerID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ownerID', Sort.asc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> thenByOwnerIDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ownerID', Sort.desc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension FarmQueryWhereDistinct on QueryBuilder<Farm, Farm, QDistinct> {
  QueryBuilder<Farm, Farm, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<Farm, Farm, QDistinct> distinctByFarmAddress(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'farmAddress', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Farm, Farm, QDistinct> distinctByFarmName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'farmName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Farm, Farm, QDistinct> distinctByOwnerID(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ownerID', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Farm, Farm, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension FarmQueryProperty on QueryBuilder<Farm, Farm, QQueryProperty> {
  QueryBuilder<Farm, int, QQueryOperations> isarIDProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarID');
    });
  }

  QueryBuilder<Farm, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<Farm, String, QQueryOperations> farmAddressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'farmAddress');
    });
  }

  QueryBuilder<Farm, String, QQueryOperations> farmNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'farmName');
    });
  }

  QueryBuilder<Farm, String, QQueryOperations> ownerIDProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ownerID');
    });
  }

  QueryBuilder<Farm, DateTime, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}

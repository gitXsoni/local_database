// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_db.dart';

// ignore_for_file: type=lint
class $PersonTable extends Person with TableInfo<$PersonTable, PersonData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PersonTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _addressMeta =
      const VerificationMeta('address');
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
      'address', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _phoneNumberMeta =
      const VerificationMeta('phoneNumber');
  @override
  late final GeneratedColumn<int> phoneNumber = GeneratedColumn<int>(
      'phone_number', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _collegeMeta =
      const VerificationMeta('college');
  @override
  late final GeneratedColumn<String> college = GeneratedColumn<String>(
      'college', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant("Prithvi Narayan Campus"));
  static const VerificationMeta _isPassedMeta =
      const VerificationMeta('isPassed');
  @override
  late final GeneratedColumn<bool> isPassed = GeneratedColumn<bool>(
      'is_passed', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_passed" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, address, phoneNumber, college, isPassed];
  @override
  String get aliasedName => _alias ?? 'person';
  @override
  String get actualTableName => 'person';
  @override
  VerificationContext validateIntegrity(Insertable<PersonData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('address')) {
      context.handle(_addressMeta,
          address.isAcceptableOrUnknown(data['address']!, _addressMeta));
    }
    if (data.containsKey('phone_number')) {
      context.handle(
          _phoneNumberMeta,
          phoneNumber.isAcceptableOrUnknown(
              data['phone_number']!, _phoneNumberMeta));
    }
    if (data.containsKey('college')) {
      context.handle(_collegeMeta,
          college.isAcceptableOrUnknown(data['college']!, _collegeMeta));
    }
    if (data.containsKey('is_passed')) {
      context.handle(_isPassedMeta,
          isPassed.isAcceptableOrUnknown(data['is_passed']!, _isPassedMeta));
    } else if (isInserting) {
      context.missing(_isPassedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PersonData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PersonData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      address: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}address']),
      phoneNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}phone_number']),
      college: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}college'])!,
      isPassed: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_passed'])!,
    );
  }

  @override
  $PersonTable createAlias(String alias) {
    return $PersonTable(attachedDatabase, alias);
  }
}

class PersonData extends DataClass implements Insertable<PersonData> {
  final int id;
  final String name;
  final String? address;
  final int? phoneNumber;
  final String college;
  final bool isPassed;
  const PersonData(
      {required this.id,
      required this.name,
      this.address,
      this.phoneNumber,
      required this.college,
      required this.isPassed});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || address != null) {
      map['address'] = Variable<String>(address);
    }
    if (!nullToAbsent || phoneNumber != null) {
      map['phone_number'] = Variable<int>(phoneNumber);
    }
    map['college'] = Variable<String>(college);
    map['is_passed'] = Variable<bool>(isPassed);
    return map;
  }

  PersonCompanion toCompanion(bool nullToAbsent) {
    return PersonCompanion(
      id: Value(id),
      name: Value(name),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
      phoneNumber: phoneNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(phoneNumber),
      college: Value(college),
      isPassed: Value(isPassed),
    );
  }

  factory PersonData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PersonData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      address: serializer.fromJson<String?>(json['address']),
      phoneNumber: serializer.fromJson<int?>(json['phoneNumber']),
      college: serializer.fromJson<String>(json['college']),
      isPassed: serializer.fromJson<bool>(json['isPassed']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'address': serializer.toJson<String?>(address),
      'phoneNumber': serializer.toJson<int?>(phoneNumber),
      'college': serializer.toJson<String>(college),
      'isPassed': serializer.toJson<bool>(isPassed),
    };
  }

  PersonData copyWith(
          {int? id,
          String? name,
          Value<String?> address = const Value.absent(),
          Value<int?> phoneNumber = const Value.absent(),
          String? college,
          bool? isPassed}) =>
      PersonData(
        id: id ?? this.id,
        name: name ?? this.name,
        address: address.present ? address.value : this.address,
        phoneNumber: phoneNumber.present ? phoneNumber.value : this.phoneNumber,
        college: college ?? this.college,
        isPassed: isPassed ?? this.isPassed,
      );
  @override
  String toString() {
    return (StringBuffer('PersonData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('address: $address, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('college: $college, ')
          ..write('isPassed: $isPassed')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, address, phoneNumber, college, isPassed);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PersonData &&
          other.id == this.id &&
          other.name == this.name &&
          other.address == this.address &&
          other.phoneNumber == this.phoneNumber &&
          other.college == this.college &&
          other.isPassed == this.isPassed);
}

class PersonCompanion extends UpdateCompanion<PersonData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> address;
  final Value<int?> phoneNumber;
  final Value<String> college;
  final Value<bool> isPassed;
  const PersonCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.address = const Value.absent(),
    this.phoneNumber = const Value.absent(),
    this.college = const Value.absent(),
    this.isPassed = const Value.absent(),
  });
  PersonCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.address = const Value.absent(),
    this.phoneNumber = const Value.absent(),
    this.college = const Value.absent(),
    required bool isPassed,
  })  : name = Value(name),
        isPassed = Value(isPassed);
  static Insertable<PersonData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? address,
    Expression<int>? phoneNumber,
    Expression<String>? college,
    Expression<bool>? isPassed,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (address != null) 'address': address,
      if (phoneNumber != null) 'phone_number': phoneNumber,
      if (college != null) 'college': college,
      if (isPassed != null) 'is_passed': isPassed,
    });
  }

  PersonCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String?>? address,
      Value<int?>? phoneNumber,
      Value<String>? college,
      Value<bool>? isPassed}) {
    return PersonCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      college: college ?? this.college,
      isPassed: isPassed ?? this.isPassed,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (phoneNumber.present) {
      map['phone_number'] = Variable<int>(phoneNumber.value);
    }
    if (college.present) {
      map['college'] = Variable<String>(college.value);
    }
    if (isPassed.present) {
      map['is_passed'] = Variable<bool>(isPassed.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PersonCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('address: $address, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('college: $college, ')
          ..write('isPassed: $isPassed')
          ..write(')'))
        .toString();
  }
}

abstract class _$MyDb extends GeneratedDatabase {
  _$MyDb(QueryExecutor e) : super(e);
  late final $PersonTable person = $PersonTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [person];
}

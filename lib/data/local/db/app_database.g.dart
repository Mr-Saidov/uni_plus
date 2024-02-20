// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $UserTableTable extends UserTable
    with TableInfo<$UserTableTable, UserTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_table';
  @override
  VerificationContext validateIntegrity(Insertable<UserTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id']),
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name']),
    );
  }

  @override
  $UserTableTable createAlias(String alias) {
    return $UserTableTable(attachedDatabase, alias);
  }
}

class UserTableData extends DataClass implements Insertable<UserTableData> {
  final int? id;
  final String? name;
  const UserTableData({this.id, this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    return map;
  }

  UserTableCompanion toCompanion(bool nullToAbsent) {
    return UserTableCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
    );
  }

  factory UserTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserTableData(
      id: serializer.fromJson<int?>(json['id']),
      name: serializer.fromJson<String?>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'name': serializer.toJson<String?>(name),
    };
  }

  UserTableData copyWith(
          {Value<int?> id = const Value.absent(),
          Value<String?> name = const Value.absent()}) =>
      UserTableData(
        id: id.present ? id.value : this.id,
        name: name.present ? name.value : this.name,
      );
  @override
  String toString() {
    return (StringBuffer('UserTableData(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserTableData &&
          other.id == this.id &&
          other.name == this.name);
}

class UserTableCompanion extends UpdateCompanion<UserTableData> {
  final Value<int?> id;
  final Value<String?> name;
  const UserTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  UserTableCompanion.insert({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  static Insertable<UserTableData> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  UserTableCompanion copyWith({Value<int?>? id, Value<String?>? name}) {
    return UserTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
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
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $MessageTableTable extends MessageTable
    with TableInfo<$MessageTableTable, MessageTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MessageTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
      'user_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _senderIdMeta =
      const VerificationMeta('senderId');
  @override
  late final GeneratedColumn<int> senderId = GeneratedColumn<int>(
      'sender_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _contentMeta =
      const VerificationMeta('content');
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
      'content', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _timeMeta = const VerificationMeta('time');
  @override
  late final GeneratedColumn<int> time = GeneratedColumn<int>(
      'time', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, userId, senderId, content, time];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'message_table';
  @override
  VerificationContext validateIntegrity(Insertable<MessageTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('sender_id')) {
      context.handle(_senderIdMeta,
          senderId.isAcceptableOrUnknown(data['sender_id']!, _senderIdMeta));
    } else if (isInserting) {
      context.missing(_senderIdMeta);
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('time')) {
      context.handle(
          _timeMeta, time.isAcceptableOrUnknown(data['time']!, _timeMeta));
    } else if (isInserting) {
      context.missing(_timeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MessageTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MessageTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id']),
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_id'])!,
      senderId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sender_id'])!,
      content: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content'])!,
      time: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}time'])!,
    );
  }

  @override
  $MessageTableTable createAlias(String alias) {
    return $MessageTableTable(attachedDatabase, alias);
  }
}

class MessageTableData extends DataClass
    implements Insertable<MessageTableData> {
  final int? id;
  final int userId;
  final int senderId;
  final String content;
  final int time;
  const MessageTableData(
      {this.id,
      required this.userId,
      required this.senderId,
      required this.content,
      required this.time});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    map['user_id'] = Variable<int>(userId);
    map['sender_id'] = Variable<int>(senderId);
    map['content'] = Variable<String>(content);
    map['time'] = Variable<int>(time);
    return map;
  }

  MessageTableCompanion toCompanion(bool nullToAbsent) {
    return MessageTableCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      userId: Value(userId),
      senderId: Value(senderId),
      content: Value(content),
      time: Value(time),
    );
  }

  factory MessageTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MessageTableData(
      id: serializer.fromJson<int?>(json['id']),
      userId: serializer.fromJson<int>(json['userId']),
      senderId: serializer.fromJson<int>(json['senderId']),
      content: serializer.fromJson<String>(json['content']),
      time: serializer.fromJson<int>(json['time']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'userId': serializer.toJson<int>(userId),
      'senderId': serializer.toJson<int>(senderId),
      'content': serializer.toJson<String>(content),
      'time': serializer.toJson<int>(time),
    };
  }

  MessageTableData copyWith(
          {Value<int?> id = const Value.absent(),
          int? userId,
          int? senderId,
          String? content,
          int? time}) =>
      MessageTableData(
        id: id.present ? id.value : this.id,
        userId: userId ?? this.userId,
        senderId: senderId ?? this.senderId,
        content: content ?? this.content,
        time: time ?? this.time,
      );
  @override
  String toString() {
    return (StringBuffer('MessageTableData(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('senderId: $senderId, ')
          ..write('content: $content, ')
          ..write('time: $time')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, userId, senderId, content, time);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MessageTableData &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.senderId == this.senderId &&
          other.content == this.content &&
          other.time == this.time);
}

class MessageTableCompanion extends UpdateCompanion<MessageTableData> {
  final Value<int?> id;
  final Value<int> userId;
  final Value<int> senderId;
  final Value<String> content;
  final Value<int> time;
  const MessageTableCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.senderId = const Value.absent(),
    this.content = const Value.absent(),
    this.time = const Value.absent(),
  });
  MessageTableCompanion.insert({
    this.id = const Value.absent(),
    required int userId,
    required int senderId,
    required String content,
    required int time,
  })  : userId = Value(userId),
        senderId = Value(senderId),
        content = Value(content),
        time = Value(time);
  static Insertable<MessageTableData> custom({
    Expression<int>? id,
    Expression<int>? userId,
    Expression<int>? senderId,
    Expression<String>? content,
    Expression<int>? time,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (senderId != null) 'sender_id': senderId,
      if (content != null) 'content': content,
      if (time != null) 'time': time,
    });
  }

  MessageTableCompanion copyWith(
      {Value<int?>? id,
      Value<int>? userId,
      Value<int>? senderId,
      Value<String>? content,
      Value<int>? time}) {
    return MessageTableCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      senderId: senderId ?? this.senderId,
      content: content ?? this.content,
      time: time ?? this.time,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (senderId.present) {
      map['sender_id'] = Variable<int>(senderId.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (time.present) {
      map['time'] = Variable<int>(time.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MessageTableCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('senderId: $senderId, ')
          ..write('content: $content, ')
          ..write('time: $time')
          ..write(')'))
        .toString();
  }
}

class $RegionTableTable extends RegionTable
    with TableInfo<$RegionTableTable, RegionTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RegionTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<int> code = GeneratedColumn<int>(
      'code', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _nameUzMeta = const VerificationMeta('nameUz');
  @override
  late final GeneratedColumn<String> nameUz = GeneratedColumn<String>(
      'nameUz', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameRuMeta = const VerificationMeta('nameRu');
  @override
  late final GeneratedColumn<String> nameRu = GeneratedColumn<String>(
      'nameRu', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameLatnMeta =
      const VerificationMeta('nameLatn');
  @override
  late final GeneratedColumn<String> nameLatn = GeneratedColumn<String>(
      'nameLatn', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _ns10CodeMeta =
      const VerificationMeta('ns10Code');
  @override
  late final GeneratedColumn<int> ns10Code = GeneratedColumn<int>(
      'ns10Code', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _soatoMeta = const VerificationMeta('soato');
  @override
  late final GeneratedColumn<int> soato = GeneratedColumn<int>(
      'soato', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [code, nameUz, nameRu, nameLatn, ns10Code, soato];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'region_table';
  @override
  VerificationContext validateIntegrity(Insertable<RegionTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('code')) {
      context.handle(
          _codeMeta, code.isAcceptableOrUnknown(data['code']!, _codeMeta));
    }
    if (data.containsKey('nameUz')) {
      context.handle(_nameUzMeta,
          nameUz.isAcceptableOrUnknown(data['nameUz']!, _nameUzMeta));
    } else if (isInserting) {
      context.missing(_nameUzMeta);
    }
    if (data.containsKey('nameRu')) {
      context.handle(_nameRuMeta,
          nameRu.isAcceptableOrUnknown(data['nameRu']!, _nameRuMeta));
    } else if (isInserting) {
      context.missing(_nameRuMeta);
    }
    if (data.containsKey('nameLatn')) {
      context.handle(_nameLatnMeta,
          nameLatn.isAcceptableOrUnknown(data['nameLatn']!, _nameLatnMeta));
    } else if (isInserting) {
      context.missing(_nameLatnMeta);
    }
    if (data.containsKey('ns10Code')) {
      context.handle(_ns10CodeMeta,
          ns10Code.isAcceptableOrUnknown(data['ns10Code']!, _ns10CodeMeta));
    } else if (isInserting) {
      context.missing(_ns10CodeMeta);
    }
    if (data.containsKey('soato')) {
      context.handle(
          _soatoMeta, soato.isAcceptableOrUnknown(data['soato']!, _soatoMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {code};
  @override
  RegionTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RegionTableData(
      code: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}code']),
      nameUz: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nameUz'])!,
      nameRu: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nameRu'])!,
      nameLatn: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nameLatn'])!,
      ns10Code: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}ns10Code'])!,
      soato: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}soato']),
    );
  }

  @override
  $RegionTableTable createAlias(String alias) {
    return $RegionTableTable(attachedDatabase, alias);
  }
}

class RegionTableData extends DataClass implements Insertable<RegionTableData> {
  final int? code;
  final String nameUz;
  final String nameRu;
  final String nameLatn;
  final int ns10Code;
  final int? soato;
  const RegionTableData(
      {this.code,
      required this.nameUz,
      required this.nameRu,
      required this.nameLatn,
      required this.ns10Code,
      this.soato});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || code != null) {
      map['code'] = Variable<int>(code);
    }
    map['nameUz'] = Variable<String>(nameUz);
    map['nameRu'] = Variable<String>(nameRu);
    map['nameLatn'] = Variable<String>(nameLatn);
    map['ns10Code'] = Variable<int>(ns10Code);
    if (!nullToAbsent || soato != null) {
      map['soato'] = Variable<int>(soato);
    }
    return map;
  }

  RegionTableCompanion toCompanion(bool nullToAbsent) {
    return RegionTableCompanion(
      code: code == null && nullToAbsent ? const Value.absent() : Value(code),
      nameUz: Value(nameUz),
      nameRu: Value(nameRu),
      nameLatn: Value(nameLatn),
      ns10Code: Value(ns10Code),
      soato:
          soato == null && nullToAbsent ? const Value.absent() : Value(soato),
    );
  }

  factory RegionTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RegionTableData(
      code: serializer.fromJson<int?>(json['code']),
      nameUz: serializer.fromJson<String>(json['nameUz']),
      nameRu: serializer.fromJson<String>(json['nameRu']),
      nameLatn: serializer.fromJson<String>(json['nameLatn']),
      ns10Code: serializer.fromJson<int>(json['ns10Code']),
      soato: serializer.fromJson<int?>(json['soato']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'code': serializer.toJson<int?>(code),
      'nameUz': serializer.toJson<String>(nameUz),
      'nameRu': serializer.toJson<String>(nameRu),
      'nameLatn': serializer.toJson<String>(nameLatn),
      'ns10Code': serializer.toJson<int>(ns10Code),
      'soato': serializer.toJson<int?>(soato),
    };
  }

  RegionTableData copyWith(
          {Value<int?> code = const Value.absent(),
          String? nameUz,
          String? nameRu,
          String? nameLatn,
          int? ns10Code,
          Value<int?> soato = const Value.absent()}) =>
      RegionTableData(
        code: code.present ? code.value : this.code,
        nameUz: nameUz ?? this.nameUz,
        nameRu: nameRu ?? this.nameRu,
        nameLatn: nameLatn ?? this.nameLatn,
        ns10Code: ns10Code ?? this.ns10Code,
        soato: soato.present ? soato.value : this.soato,
      );
  @override
  String toString() {
    return (StringBuffer('RegionTableData(')
          ..write('code: $code, ')
          ..write('nameUz: $nameUz, ')
          ..write('nameRu: $nameRu, ')
          ..write('nameLatn: $nameLatn, ')
          ..write('ns10Code: $ns10Code, ')
          ..write('soato: $soato')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(code, nameUz, nameRu, nameLatn, ns10Code, soato);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RegionTableData &&
          other.code == this.code &&
          other.nameUz == this.nameUz &&
          other.nameRu == this.nameRu &&
          other.nameLatn == this.nameLatn &&
          other.ns10Code == this.ns10Code &&
          other.soato == this.soato);
}

class RegionTableCompanion extends UpdateCompanion<RegionTableData> {
  final Value<int?> code;
  final Value<String> nameUz;
  final Value<String> nameRu;
  final Value<String> nameLatn;
  final Value<int> ns10Code;
  final Value<int?> soato;
  const RegionTableCompanion({
    this.code = const Value.absent(),
    this.nameUz = const Value.absent(),
    this.nameRu = const Value.absent(),
    this.nameLatn = const Value.absent(),
    this.ns10Code = const Value.absent(),
    this.soato = const Value.absent(),
  });
  RegionTableCompanion.insert({
    this.code = const Value.absent(),
    required String nameUz,
    required String nameRu,
    required String nameLatn,
    required int ns10Code,
    this.soato = const Value.absent(),
  })  : nameUz = Value(nameUz),
        nameRu = Value(nameRu),
        nameLatn = Value(nameLatn),
        ns10Code = Value(ns10Code);
  static Insertable<RegionTableData> custom({
    Expression<int>? code,
    Expression<String>? nameUz,
    Expression<String>? nameRu,
    Expression<String>? nameLatn,
    Expression<int>? ns10Code,
    Expression<int>? soato,
  }) {
    return RawValuesInsertable({
      if (code != null) 'code': code,
      if (nameUz != null) 'nameUz': nameUz,
      if (nameRu != null) 'nameRu': nameRu,
      if (nameLatn != null) 'nameLatn': nameLatn,
      if (ns10Code != null) 'ns10Code': ns10Code,
      if (soato != null) 'soato': soato,
    });
  }

  RegionTableCompanion copyWith(
      {Value<int?>? code,
      Value<String>? nameUz,
      Value<String>? nameRu,
      Value<String>? nameLatn,
      Value<int>? ns10Code,
      Value<int?>? soato}) {
    return RegionTableCompanion(
      code: code ?? this.code,
      nameUz: nameUz ?? this.nameUz,
      nameRu: nameRu ?? this.nameRu,
      nameLatn: nameLatn ?? this.nameLatn,
      ns10Code: ns10Code ?? this.ns10Code,
      soato: soato ?? this.soato,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (code.present) {
      map['code'] = Variable<int>(code.value);
    }
    if (nameUz.present) {
      map['nameUz'] = Variable<String>(nameUz.value);
    }
    if (nameRu.present) {
      map['nameRu'] = Variable<String>(nameRu.value);
    }
    if (nameLatn.present) {
      map['nameLatn'] = Variable<String>(nameLatn.value);
    }
    if (ns10Code.present) {
      map['ns10Code'] = Variable<int>(ns10Code.value);
    }
    if (soato.present) {
      map['soato'] = Variable<int>(soato.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RegionTableCompanion(')
          ..write('code: $code, ')
          ..write('nameUz: $nameUz, ')
          ..write('nameRu: $nameRu, ')
          ..write('nameLatn: $nameLatn, ')
          ..write('ns10Code: $ns10Code, ')
          ..write('soato: $soato')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $UserTableTable userTable = $UserTableTable(this);
  late final $MessageTableTable messageTable = $MessageTableTable(this);
  late final $RegionTableTable regionTable = $RegionTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [userTable, messageTable, regionTable];
}

import 'package:mobile/models/common/enums.dart';
import 'package:mobile/models/eventTag.model.dart';
import 'package:mobile/models/university.model.dart';

import '../models/common/address.model.dart';
import '../models/event.model.dart';
import '../models/tag.model.dart';
import '../models/user.model.dart';

final mockAddress = Address(
    prefecture: Prefecture.chiba,
    municipalities: '八千代市富田町',
    houseNumber: '8-9-38');
final mockUniversity = University(
    id: '873',
    university: UniversityDictionary.tus,
    campus: '野田キャンパス',
    address: mockAddress);
final mockTag = Tag(id: '274', name: 'テニス');
final mockTag2 = Tag(id: '2748', name: '野球');
final mockEventTag = EventTag(id: '362', name: '飲み会');
final mockEventTag2 = EventTag(id: '3628', name: 'ビジコン');
final mockUser = User(
    id: '83d',
    firstName: '和樹',
    lastName: '田中',
    firstNameKana: 'カズキ',
    lastNameKana: 'タナカ',
    username: 'camerom',
    email: 'test@example.com',
    role: UserRole.visitor,
    gender: Gender.male,
    birthDate: DateTime(2020, 10, 2, 12, 10),
    address: mockAddress,
    university: mockUniversity,
    introduction: 'よろしく',
    tags: [mockTag, mockTag2],
    eventTags: [mockEventTag, mockEventTag2]);
final mockEvent = EventModel(
    id: '892',
    title: '一日テニス体験',
    creator: mockUser,
    recruitEndedAt: DateTime(2020, 10, 2, 12, 10),
    startedAt: DateTime(2020, 10, 2, 12, 10),
    endedAt: DateTime(2020, 10, 2, 12, 10),
    address: mockAddress,
    capacity: 30,
    participationFee: 800,
    detail: 'よろしくお願いします');

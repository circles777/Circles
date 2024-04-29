import 'package:mobile/models/common/enums.dart';
import 'package:mobile/models/eventTag.model.dart';
import 'package:mobile/models/square.modal.dart';
import 'package:mobile/models/university.model.dart';
import 'package:mobile/models/userBookedEvent.model.dart';
import 'package:mobile/models/userJoinedSquare.model.dart';

import '../models/common/address.model.dart';
import '../models/event.model.dart';
import '../models/tag.model.dart';
import '../models/user.model.dart';

final mockAddress = Address(
    prefecture: Prefecture.chiba,
    municipalities: '八千代市富田町',
    houseNumber: '8-9-38');
/*final mockUniversity = University(
    //id: '873',
    university: UniversityDictionary.tus,
    faculty: '創域理工学部',
    department: '電気電子情報工学科',
    campus: '野田キャンパス',
    address: mockAddress);*/

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
    photoUrl: 'public/mican.jpeg',
    role: UserRole.visitor,
    gender: Gender.male,
    birthDate: DateTime(2020, 10, 2, 12, 10),
    address: mockAddress,
    //university: mockUniversity,
    university: UniversityDictionary.sophia,
    faculty: '理工学部',
    department: '機械工学科',
    grade: 4,
    introduction: 'よろしく',
    tags: [mockTag, mockTag2],
    eventTags: [mockEventTag, mockEventTag2]);

final mockEvent = EventModel(
  id: '892',
  title: '一日テニス体験',
  photoUrl: 'public/circle1.jpg',
  creator: mockUser,
  recruitEndedAt: DateTime(2020, 10, 2, 12, 10),
  startedAt: DateTime(2020, 10, 2, 12, 10),
  endedAt: DateTime(2020, 10, 2, 12, 10),
  address: mockAddress,
  capacity: 30,
  participationFee: 800,
  detail: '電電の4年生でフットサルをします！よろしくお願いします!',
  //userBookedEvents: List.generate(5, (i) => mockUserBookedEvent)
);

final mockEvent2 = EventModel(
  id: '8928',
  title: 'キャンプ体験',
  photoUrl: 'public/circle1.jpg',
  creator: mockUser,
  recruitEndedAt: DateTime(2020, 9, 21, 12, 10),
  startedAt: DateTime(2020, 10, 2, 12, 10),
  endedAt: DateTime(2020, 10, 20, 12, 10),
  address: mockAddress,
  capacity: 30,
  participationFee: 800,
  detail:
      '私たちは日本各地でキャンピングをしている自然が大好きなキャンプ愛好家たちが集まったサークルです。このサークルが設立されて8年になりますが、これまで関東近辺もちろんのこと、東北、四国、九州、北海道と日本全国でキャンプをしてきました。 キャンプする際にはみんなが楽しめるような数多くのレクリエーションがあるので、ぜひ体験で説明会に来てみてください!',
  //userBookedEvents: List.generate(8, (i) => mockUserBookedEvent)
);

final mockUserBookedEvent =
    UserBookedEvent(id: '83493', user: mockUser, event: mockEvent);

final mockEvent11 = EventModel(
    id: '892',
    title: '一日テニス体験',
    photoUrl: 'public/circle1.jpg',
    creator: mockUser,
    recruitEndedAt: DateTime(2020, 10, 2, 12, 10),
    startedAt: DateTime(2020, 10, 2, 12, 10),
    endedAt: DateTime(2020, 10, 2, 12, 10),
    address: mockAddress,
    capacity: 30,
    participationFee: 800,
    detail:
        '私たちは日本各地でキャンピングをしている自然が大好きなキャンプ愛好家たちが集まったサークルです。このサークルが設立されて8年になりますが、これまで関東近辺もちろんのこと、東北、四国、九州、北海道と日本全国でキャンプをしてきました。 キャンプする際にはみんなが楽しめるような数多くのレクリエーションがあるので、ぜひ体験で説明会に来てみてください!!',
    userBookedEvents: List.generate(5, (i) => mockUserBookedEvent).toList());

final mockSquare = Square(
    id: '2494',
    name: 'コンサル志望集会！',
    photoUrl: 'public/consul.jpeg',
    detail: '各大学のコンサル志望の方々で情報交換をし合うための場所です！さまざまな対面イベントもあるのでぜひ！');

final mockUserJoinedSquare =
    UserJoinedSquare(id: '4822', user: mockUser, square: mockSquare);

final mockSquare11 = Square(
    id: '24943',
    name: 'コンサル志望集会！',
    photoUrl: 'public/consul.jpeg',
    detail: '各大学のコンサル志望の方々で情報交換をし合うための場所です！さまざまな対面イベントもあるのでぜひ！',
    userJoinedSquares: List.generate(17, (index) => mockUserJoinedSquare));

final testString = 'これはテストです';

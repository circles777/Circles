enum ForumCategory {
  /*jobHunting('jobHunting'),
  part('part'),
  love('love'),
  sport('sport'),
  game('game'),
  food('food'),
  entertainment('entertainment'),
  scaryStory('scaryStory'),
  funnyStory('funnyStory');*/
  jobHunting('就活'),
  part('バイト'),
  love('恋愛'),
  sport('スポーツ'),
  game('ゲーム'),
  food('食べ物'),
  entertainment('エンタメ'),
  scaryStory('怖い話'),
  funnyStory('面白い話');

  const ForumCategory(this.displayName);
  final String displayName;
}

enum UniversityDictionary {
  tus('tus'),
  ut('ut'),
  ku('ku'),
  tt('tt'),
  sophia('sophia'),
  waseda('waseda'),
  keio('keio');

  const UniversityDictionary(this.displayName);
  final String displayName;

  String toJP() {
    switch (this) {
      case UniversityDictionary.tus:
        return '東京理科大学';
      case UniversityDictionary.ut:
        return '東京大学';
      case UniversityDictionary.ku:
        return '京都大学';
      case UniversityDictionary.tt:
        return '東京工業大学';
      case UniversityDictionary.sophia:
        return '上智大学';
      case UniversityDictionary.waseda:
        return '早稲田大学';
      case UniversityDictionary.keio:
        return '慶應大学';
      default:
        return '';
    }
  }
}

enum Prefecture {
  hokkaido('hokkaido'),
  aomori('aomori'),
  iwate('iwate'),
  miyagi('miyagi'),
  akita('akita'),
  yamagata('yamagata'),

  hukushima('hukushima'),
  ibaragi('ibaragi'),
  tochigi('tochigi'),

  gunnma('gunnma'),
  saitama('saitama'),
  chiba('chiba'),

  tokyo('tokyo'),
  kanagawa('kanagawa'),
  niigata('niigata'),

  toyama('toyama'),
  ishikawa('ishikawa'),
  hukui('hukui'),

  yamanashi('yamanashi'),
  nagano('nagano'),
  gihu('gihu'),

  shizuoka('shizuoka'),
  aichi('aichi'),
  mie('mie'),

  shiga('shiga'),
  kyoto('kyoto'),
  osaka('osaka'),

  hyogo('hyogo'),
  nara('nara'),
  wakayama('wakayama'),

  tottori('tottori'),
  shimane('shimane'),
  okayama('okayama'),

  hiroshima('hiroshima'),
  yamaguchi('yamaguchi'),
  tokushima('tokushima'),

  kagawa('kagawa'),
  ehime('ehime'),
  kochi('kochi'),

  hukuoka('hukuoka'),
  saga('saga'),
  nagasaki('nagasaki'),

  kumamoto('kumamoto'),
  oita('oita'),
  miyazaki('miyazaki'),

  kagoshima('kagoshima'),
  okinawa('okinawa');

  const Prefecture(this.displayName);
  final String displayName;

  String toJP() {
    switch (this) {
      case Prefecture.hokkaido:
        return '北海道';
      case Prefecture.aomori:
        return '青森県';
      case Prefecture.iwate:
        return '岩手県';

      case Prefecture.miyagi:
        return '宮城県';
      case Prefecture.akita:
        return '秋田県';
      case Prefecture.yamagata:
        return '山形県';

      case Prefecture.hukushima:
        return '福島県';
      case Prefecture.ibaragi:
        return '茨城県';
      case Prefecture.tochigi:
        return '栃木県';

      case Prefecture.gunnma:
        return '群馬県';
      case Prefecture.saitama:
        return '埼玉県';
      case Prefecture.chiba:
        return '千葉県';

      case Prefecture.tokyo:
        return '東京都';
      case Prefecture.kanagawa:
        return '神奈川県';
      case Prefecture.niigata:
        return '新潟県';

      case Prefecture.toyama:
        return '富山県';
      case Prefecture.ishikawa:
        return '石川県';
      case Prefecture.hukui:
        return '福井県';

      case Prefecture.yamanashi:
        return '山梨県';
      case Prefecture.nagano:
        return '長野県';
      case Prefecture.gihu:
        return '岐阜県';

      case Prefecture.shizuoka:
        return '静岡県';
      case Prefecture.aichi:
        return '愛知県';
      case Prefecture.mie:
        return '三重県';

      case Prefecture.shiga:
        return '滋賀県';
      case Prefecture.kyoto:
        return '京都府';
      case Prefecture.osaka:
        return '大阪府';

      case Prefecture.hyogo:
        return '兵庫県';
      case Prefecture.nara:
        return '奈良県';
      case Prefecture.wakayama:
        return '和歌山県';

      case Prefecture.tottori:
        return '鳥取県';
      case Prefecture.shimane:
        return '島根県';
      case Prefecture.okayama:
        return '岡山県';

      case Prefecture.hiroshima:
        return '広島県';
      case Prefecture.yamaguchi:
        return '山口県';
      case Prefecture.tokushima:
        return '徳島県';

      case Prefecture.kagawa:
        return '香川県';
      case Prefecture.ehime:
        return '愛媛県';
      case Prefecture.kochi:
        return '高知県';

      case Prefecture.hukuoka:
        return '福岡県';
      case Prefecture.saga:
        return '佐賀県';
      case Prefecture.nagasaki:
        return '長崎県';

      case Prefecture.kumamoto:
        return '熊本県';
      case Prefecture.oita:
        return '大分県';
      case Prefecture.miyazaki:
        return '宮崎県';

      case Prefecture.kagoshima:
        return '鹿児島県';
      case Prefecture.okinawa:
        return '沖縄県';
      default:
        return '';
    }
  }
}

enum UserRole {
  author('author'), //括るやつは大文字にしてしまうとbyNameで認識されなくなってしまう
  visitor('visitor'); //中の値はアルファベットじゃないとbyNameで認識されない

  const UserRole(this.displayName);
  final String displayName;
}

enum Gender {
  male('male'),
  female('female'),
  transgender('transgender'),
  ;

  const Gender(this.displayName);
  final String displayName;

  String toJP() {
    switch (this) {
      case Gender.male:
        return '男性';
      case Gender.female:
        return '女性';
      case Gender.transgender:
        return 'トランスジェンダー';
      default:
        return '';
    }
  }
}

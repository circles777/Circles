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
  TUS('東京理科大学'),
  UT('東京大学'),
  KU('京都大学'),
  TT('東京工業大学'),
  Sophia('上智大学'),
  Waseda('早稲田大学'),
  Keio('慶應大学');

  const UniversityDictionary(this.displayName);
  final String displayName;
}

enum Prefecture {
  Hokkaido('北海道'),
  Aomori('青森県'),
  Iwate('岩手県'),
  Miyagi('宮城県'),
  Akita('秋田県'),
  Yamagata('山形県'),
  Hukushima('福島県'),
  Ibaragi('茨城県'),
  Tochigi('栃木県'),
  Gunnma('群馬県'),
  Saitama('埼玉県'),
  Chiba('千葉県'),
  Tokyo('東京都'),
  Kanagawa('神奈川県'),
  Niigata('新潟県'),
  Toyama('富山県'),
  Ishikawa('石川県'),
  Hukui('福井県'),
  Yamanashi('山梨県'),
  Nagano('長野県'),
  Gihu('岐阜県'),
  Shizuoka('静岡県'),
  Aichi('愛知県'),
  Mie('三重県'),
  Shiga('滋賀県'),
  Kyoto('京都府'),
  Osaka('大阪府'),
  Hyogo('兵庫県'),
  Nara('奈良県'),
  Wakayama('和歌山県'),
  Tottori('鳥取県'),
  Shimane('島根県'),
  Okayama('岡山県'),
  Hiroshima('広島県'),
  Yamaguchi('山口県'),
  Tokushima('徳島県'),
  Kagawa('香川県'),
  Ehime('愛媛県'),
  Kochi('高知県'),
  Hukuoka('福岡県'),
  Saga('佐賀県'),
  Nagasaki('長崎県'),
  Kumamoto('熊本県'),
  Oita('大分県'),
  Miyazaki('宮崎県'),
  Kagoshima('鹿児島県'),
  Okinawa('沖縄県');

  const Prefecture(this.displayName);
  final String displayName;
}

enum UserRole {
  Author('author'),
  Visitor('visitor');

  const UserRole(this.displayName);
  final String displayName;
}

enum Gender {
  Male('男性'),
  Female('女性'),
  Transgender('トランスジェンダー');

  const Gender(this.displayName);
  final String displayName;
}

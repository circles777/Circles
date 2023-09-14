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

enum Departments{
  science1('理学部第一部'),
  engineering('工学部'),
  phscience('薬学部'),
  scienceandtech('創域理工学部'),
  adengineering('先進工学部'),
  management('経営学部');

  const Departments(this.displayName);
  final String displayName; 
}


enum Faculties{
  s('数学科'),
  os('応用数学科'),
  b('物理学科'),
  k('化学科'),
  ok('応用科学科'),

  c('工業化学科'),
  a('建築学科'),
  e('電気工学科'),
  i('情報工学科'),
  m('機械工学科'),

  yp('薬学科'),
  ym('生命創薬科学科'),

  ma('数理科学科'),
  ph('先端物理学科'),
  is0('情報計算科学科'),   //isは使用不可のため
  bs('生命生物化学科'),
  ar('建築学科'),
  ca('先端科学科'),
  ee('電気電子情報工学科'),
  ia('経営システム工学科'),
  me('機械航空宇宙工学科'), 
  cv('社会基盤工学科'),

  ae('電子システム工学科'),
  am('マテリアル創成工学科'),
  ab('生命システム工学科'),
  ap('物理工学科'),               //Department of Applied Physics
  fd('機能デザイン工学科'),       //Department of Medical and Robotic Engineering Designだが、機能デザインがFunction Designのためfd
  
  ms('経営学科'),
  be('ビジネスエコノミクス学科'),
  idm('国際デザイン学科');

  const Faculties(this.displayName);
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

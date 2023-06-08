flutter_hooks: ^0.18.2+1 #Hooks を使用できるようにする。StatefulWidget を使う必要がなくなる(React の useState, useEffect のようなもの)
flutter_riverpod: ^1.0.3 #グローバル変数を保持できるようになる(React の Redux のようなもの)
hooks_riverpod: flutter_hooks と Riverpod の両方を使用する想定で作られている
flutter では関数はクラスの中で作るのが基本、例外として 「③setState の中で、関数の戻り値を応用するパターン」が挙げられる。

String editMessage({@required String message}) {
return "太郎くん${message}";
}

riverpod の state_notifire の使い方は以下のような感じ
https://riverpod.dev/ja/docs/providers/state_notifier_provider

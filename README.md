# providerを使ったFlutter MVVMプロジェクト

[MVVM in Flutter using Providers](https://itnext.io/mvvm-in-flutter-using-providers-409c3c7e654)を参考に作ったMVVMサンプルプロジェクトです。



## ファイル構成

- users_list/views

  - home_screen.dart

    リスト画面、１行ごとのWidgetはcomponents/user_list_row.dartで表示している

  - user_detail_screen.dart

    リスト画面をタップしたときに表示される詳細画面

  - add_user_screen.dart

    リスト画面のナビゲーションバーにある"+"ボタンタップしたときに表示される入力画面

- users_list/view_models

  - user_view_model.dart

    ViewModel。下記の機能を実現

    - リストの取得
    - リスト画面でタップされたときに選択されたユーザー情報の保持
    - 入力画面の入力情報保持とリストへ追加

- users_list/models

  - users_list_model.dart

    JSONデータ構造を定義しているファイル。[quicktype](https://app.quicktype.io/)で生成されたコードベースにNullSafetyの追加対応している

  - user_error.dart

    user_view_model.dartでリスト取得した結果エラーとなった時のエラー情報を保持するための定義

- users_list/repo

  - user_services.dart

    JSONデータを取得する(fetch)

  - api_status.dart

    JSONデータ取得結果を保持するための定義

- users_list/components

  - user_list_row.dart

    リスト表示の１行ごとのデザインを定義したWidget

  - app_titile.dart

    タイトル表示などに使うようの装飾をつけたText Widget

  - app_loading.dart

    ロード中のプログレス表示するWidget

  - app_error.dart

    エラー発生時のメッセージ表示するWidget



### 参考

- [MVVM in Flutter using Providers](https://itnext.io/mvvm-in-flutter-using-providers-409c3c7e654)

  参考にした記事

- [[#Google](https://www.youtube.com/hashtag/google) Flutter - MVVM in Flutter using Providers.](https://youtu.be/W1e7d3cvnRo)

  上記記事のハンズオン動画

- [quicktype](https://app.quicktype.io/)

  JSONからDartコードを生成してくれるサイト


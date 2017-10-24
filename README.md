# README
ブログアプリで、アカウントとパスワードを作り、ユーザー通しでつぶやきを共有できます。
投稿編集と削除ができます。
100文字以上で編集、または投稿の保存に失敗するとエラーメッセージが表示されます
名前とemailアドレスを登録、編集できます。
ユーザーの画像をアップロードできます。
(ファイル名はデータベースに、画像データ自身はpublicフォルダ内に保存します。)
ページを移動してもブラウザにユーザー情報を保持し続けます。
・ログイン・ログアウト機能	
	ログインするとヘッダーにsession[:user_id],・投稿一覧、・新規投稿、ログアウトが表示され、ログアウトまたはログインしていないと・about app,・ログインが表示されます
	ユーザーを新規登録すると自動的にログインされます
	ログインしていなくてもURLを直接入力してアクセスできてしまうのを防ぐために@current_userがnilの場合はflash[:notice]が表示され、loginページにリダイレクトされます(アクセス制限はauthenticate_userメソッドを使います)。
	ログインしているユーザーの情報のみ編集できます
・投稿とユーザーを紐づける
  誰がどの投稿をしたのかがわかります。
  自分以外のユーザーが自分の投稿を編集したり削除することを防ぎます
・いいね機能
  他のユーザーの投稿にいいねができ、いいねを取り消すことができます。
  いいねした投稿を一覧にまとめて見ることができます

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

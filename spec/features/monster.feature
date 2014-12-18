# encoding: utf-8
# language: ja

@common
機能: 表示画面を確認

  @hoge
  シナリオ: トップページにアクセスし内容を確認
    前提 サイトにアクセスする
    もし トップページを表示する
    ならば 画面にGmailと表示されていること

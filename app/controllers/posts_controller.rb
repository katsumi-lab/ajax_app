class PostsController < ApplicationController
  #indexアクションはpostモデル経由でpostsテーブルから全ての情報を取得しビューへ送る 
  #orderで新しいメモが一番上に表示される
  def index
    @posts = Post.all.order(id: "DESC")
  end

  def create
    #メモ作成時に未読の情報を保存する
    post = Post.create(content: params[content], checked: false)
    #Ajaxを実現する為にレスポンスをJSONに変更
    render json:{ post: post }
  end

  def checked

    post = Post.find(params[:id]) #既読したmemoのIDが渡される
    if post.checked  #既読であるか判定するプロパティ
      post.update(checked: false)
    else
      post.update(checked: true)
    end

    item = Post.find(params[:id]) #更新したレコードを取得し直し
    render json: { post: item } #JSON形式としてchecked.jsに返却
  end
end

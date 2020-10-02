class PostsController < ApplicationController
  #indexアクションはpostモデル経由でpostsテーブルから全ての情報を取得しビューへ送る 
  #orderで新しいメモが一番上に表示される
  def index
    @posts = Post.all.order(id: "DESC")
  end

  #createアクションはPostモデル経由でpostsテーブルに投稿を行う
  def create
    Post.create(content: params[:content])
    redirect_to action: :index
  end
end

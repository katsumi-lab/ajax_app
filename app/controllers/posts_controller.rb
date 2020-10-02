class PostsController < ApplicationController
  #indexアクションはpostモデル経由でpostsテーブルから全ての情報を取得しビューへ送る 
  def index
    @posts = Post.all
  end

  def new
  end
  #createアクションはPostモデル経由でpostsテーブルに投稿を行う
  def create
    Post.create(content: params[:content])
  end
end

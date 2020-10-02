Rails.application.routes.draw do
  #postsを取得するというリクエストにpostsコントローラーでindexアクション
  get 'posts', to: 'posts#index' 
  get 'posts/new', to: 'posts#new'
  post 'posts', to: 'posts#create'
end

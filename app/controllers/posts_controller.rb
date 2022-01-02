class PostsController < ApplicationController
  def index
    @post = Post.all
    @cont = Post.count 
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params.require(:post).permit(:title,:startdate,:enddate,:check,:memo))
      if @post.save
        flash[:notice] = "スケジュール登録しました"
        redirect_to :posts
      else
        flash.now[:notice] = "スケジュール登録できませんでした"
        render 'new'
      end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
      if @post.update(params.require(:post).permit(:title,:startdate,:enddate,:check,:memo)) 
        flash[:notice] = "スケジュールID『#{@post.id}』の内容が更新されました"
        redirect_to :posts
      else
        render 'edit'
      end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "スケジュールID『#{@post.id}』の内容を削除しました"
    redirect_to :posts
  end
end

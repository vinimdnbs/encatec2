#encoding=UTF-8

class PostsController < ApplicationController
  before_filter :authenticate_user

  def index
    @title = 'II ENCATEC - Posts'
    @posts = Post.all
  end

  def show
    @title = 'II ENCATEC - Posts'
    @post = Post.find(params[:id])
  end

  def new
    @title = 'II ENCATEC - Posts'
    @post = Post.new
  end

  def edit
    @title = 'II ENCATEC - Posts'
    @post = Post.find(params[:id])
  end

  def create
    @title = 'II ENCATEC - Posts'
    @post = Post.new(params[:post])

    if @post.save
      redirect_to @post, :notice => 'Post was successfully created.'
    else
      render :action => "new"
    end
  end

  def update
    @title = 'II ENCATEC - Posts'
    @post = Post.find(params[:id])

    if @post.update_attributes(params[:post])
      redirect_to @post, :notice =>  'Post was successfully updated.'
    else
      render :action => "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_url
  end
end

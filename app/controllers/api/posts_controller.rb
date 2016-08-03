module Api
  class PostsController < ApplicationController

    def index
      @posts = Post.all
      if @posts
        render json: @posts, status: 200
      end
    end

    def new
      @post = Post.new
    end

    def create
    end

    def edit
    end

    def update
    end

    def destroy
    end
  end
end

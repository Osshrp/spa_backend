module Api
  class PostsController < ApplicationController

    def index
      if @posts = Post.all
        render json: @posts, status: 200
      else
        unsuccess_search 404
      end
    end

    def show
      if find_post
        render json: @post, status:200
      else
        unsuccess_search 404
      end
    end

    def create
      if @post = Post.create(post_params)
        success_search 201
      else
        unsuccess_search 500
      end
    end

    def update
      if find_post.update(post_params)
        success_search 200
      else
        unsuccess_search 404
      end
    end

    def destroy
      if find_post.destroy
        success_search 200
      else
        unsuccess_search 404
      end
    end

    private

    def post_params
      params.require(:post).permit(:username, :title, :body)
    end

    def find_post
      @post = Post.find(params[:id])
    end

    def success_search(http_status)
      render json: { message: 'success' }, status: http_status
    end

    def unsuccess_search(http_status)
      render nothing: true, status: http_status
    end
  end
end

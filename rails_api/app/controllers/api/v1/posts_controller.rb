module Api
  module V1
    class PostsController < ApplicationController
      def index
        posts = Post.all
        Rails.logger.info "Posts: #{posts.to_json}" # Log the posts to the console for debugging purposes
        render json: posts, status: :ok
      end
    end
  end
end
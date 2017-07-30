class PostsController < ApplicationController
	before_action :find_post, only: [:show , :edit , :update , :destroy] 
	before_action :signed_in_user, only: [:new, :create]

	def new
		@post = Post.new
	end
	def create
		@post = Post.new(post_params)
		@post.user_id = current_user.id
		if @post.save
			redirect_to root_path

		else 
			render "new"
		end
	end

	def index
		@posts = Post.all
	end
	private
	def find_post
		@post = Post.find(params[:id])
	end

	def post_params
		params.require(:post).permit(:title , :body)
	end
	# before filter/action
	def signed_in_user
		unless logged_in?
			redirect_to signin_url
		end
	end
end

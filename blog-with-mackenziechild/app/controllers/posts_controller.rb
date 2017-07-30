class PostsController < ApplicationController
	before_action :authenticate_user!, except: [:index,:show]
	def index
		@posts = Post.all.order("created_at DESC")
	end
	def new
		@post = Post.new
	end
	def show
		@post = Post.find(params[:id])
	end
	def create
		@post = Post.new(posts_params)
		@post.save

		redirect_to @post
	end
	def edit
		@post = Post.find(params[:id])
	end
	def update
		@post = Post.find(params[:id])
		if @post.update(posts_params)
			redirect_to @post
		else
			render 'edit'
		end
	end
	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to root_path
	end
	private
		def posts_params
			params.require(:post).permit(:title,:body)
		end
end

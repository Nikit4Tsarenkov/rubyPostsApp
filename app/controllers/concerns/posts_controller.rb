class PostsController < ApplicationController

	before_action :authenticate_user!, except: [:index, :show]
	
	def index
	@posts = Post.all
	end

	def new
	@post = current_user.posts.build
	end

	def create
	@post = current_user.posts.build(post_params)

	if @post.save
		redirect_to @post
	else
		render 'new'
	end
	end

	def show
	@post = Post.find(params[:id])
	end

	def update
	@post = Post.find(params[:id])

	if @post.update(post_params)
		redirect_to @post
	else
		render 'edit'
	end
end


	def edit
	@post = Post.find(params[:id])
	end

	private 
	def post_params
	params.require(:post).permit(:title, :content)
	end
end
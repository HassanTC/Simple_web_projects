class CommentsController < ApplicationController
  before_action :set_comment, only: [:destroy]
  before_action :logged_user
  before_action :right_user, only: [:destroy]
  def create
    @link = Link.find(params[:link_id])
    @comment = @link.comments.new(comment_params)
    @comment.user = current_user
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @link, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end
    def comment_params
      params.require(:comment).permit(:link_id, :body, :user_id)
    end
    def logged_user
      redirect_to new_user_session_path unless current_user
    end
    def right_user
      redirect_to :back if current_user != @comment.user
    end
end

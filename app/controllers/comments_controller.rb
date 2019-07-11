class CommentsController < ApplicationController

  skip_before_action :authorized, only: [:create, :index, :show]

  def index
    @comments = Comment.all
    render json: @comments
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.create(comment_params)
    render json: @comment
  end

  def show
    @comment = Comment.find(params[:id])
    render json: @comment
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id, :destination_id)
  end
end

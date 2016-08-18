class CommentsController < ApplicationController
  def create
    @base = Book.find(params[:comment][:book_id]) unless params[:comment][:book_id].nil?
    @base = Author.find(params[:comment][:author_id]) unless params[:comment][:author_id].nil?

    redirect_to root_path if @base.nil?

    @comment = @base.comments.build
    @comment.body = params[:comment][:body]

    if @comment.save
      redirect_to book_path(@base) unless params[:comment][:book_id].nil?
      redirect_to author_path(@base) unless params[:comment][:author_id].nil?
    else
      redirect_to book_path(@base), notice: "Olmadı" unless params[:comment][:book_id].nil?

    end
  end

  def destroy
    set_comment
    @comment.destroy
    redirect_to root_path


  end

  private
  def comment_params
    params.require(:comment).permit(:body, :book_id) unless params[:comment][:book_id].nil?
    params.require(:comment).permit(:body, :author_id) unless params[:comment][:author_id].nil?
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end

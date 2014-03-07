class CommentsController < ApplicationController

  http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy

  def create
    @book = Book.find(params[:book_id])
    @comment = @book.comments.create(params[:comment].permit(:commenter, :body))
    redirect_to book_path(@book)
  end

  def destroy
    @book = Book.find(params[:book_id])
    @comment = @book.comments.find(params[:id])
    @comment.destroy
    redirect_to book_path(@book)
  end
end

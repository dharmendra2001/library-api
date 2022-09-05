class BooksController < ApplicationController
  load_and_authorize_resource 

  def index 
  @book = Book.all
  render json: @book
  end

  def show
    @book = Book.find(params[:id])
    if @book 
      render json: @book
    else
      render json: {message: "Book not found"}
    end
  end

  def create
    @add_book = Book.new(book_params)
    if @add_book.save 
      render json: {message: "Book added successfull"}
    else 
      render json: {message: "Book not added"}
    end
  end

  def update 
    @update_book = Book.find(params[:id])
    if @update_book.update(book_params)
      render json: {message: "Book update successfull"}
    else
      render json: {message: "Book Not update"}
    end   
  end

  def destroy 
    @book_delete = Book.find(params[:id])
    if @book_delete.destroy 
      render json: {message: "Book delete successfull"}
    else
      render json: {message: "Book Not delete"}
    end
  end
 
  private 
    
  def book_params 
    params.require(:book).permit(:name, :author_name, :edition, :quantity)
  end
    
end

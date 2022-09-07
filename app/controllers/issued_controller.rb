class IssuedController < ApplicationController
  def index 
    if current_user.role == 'admin'
      @books = IssuedBook.all
      no_book
    else
      @books = current_user.issuedBooks.all
      #render json: @books
      no_book
    end
  end

  def issue
    authorize! :issue , Book
    @book = Book.find_by(name: params[:name])
    if q_more_than_i(@book.quantity,@book.issuedBooks.size)
      if @book.issuedBooks.create(user_id: params[:id])
        render json: {message: "book successfully issued"}
      else
        render json: {message: "issued error 13"}
      end
    else
      render json: {message: "no books left"}
    end
  end
  
  def return
    @user = IssuedBook.find(params[:id])
    # @b=@user.issuedBooks.all
    # @book = @user.find(params[:book_id])
    if @user.destroy
      render json: {message: "Book returned successfully"}
    else
      render json: {message: "Book not returned"}
    end

    
  end

  private

  def q_more_than_i(q,i)
    if(q<=i)
      return false
    else
      return true
    end
  end

  def no_book
    if @books.empty?
      render json: {message: "no issued Books"}
    else
      render json: @books
    end
  end
end

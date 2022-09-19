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
    @issue = IssuedBook.find_by(book_id: @book.id)
    if !@issue.blank?
      render json: {message: "Book Already issued"}
    else
      if q_more_than_i(@book.quantity,@book.issuedBooks.size)
        if @book.issuedBooks.create(user_id: params[:id])
          @book.update(quantity: @book.quantity - 1)
          render json: {message: "book successfully issued"}
        else
          render json: {message: "issued error 13"}
        end
      else
        render json: {message: "no books left"}
      end
    end
  end
  
  def return
    authorize! :return , IssuedBook
    @user = IssuedBook.find(params[:id])
    if @user.destroy
      @book = Book.find_by(id: @user.book_id)
      @book.update(quantity: @book.quantity + 1)
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

class BooksController < ApplicationController

  def top
  end

  def index
   	@book = Book.new
   	@books = Book.all
  end

  def create
  	@book = Book.new(book_params)
  	if @book.save
  		redirect_to @book, notice: 'Book was successfully created!'
  	else
  		@books = Book.all
  		render :index
  	end
  end

  def edit
  	@book = Book.find(params[:id])
  end

  def show
  	@book = Book.find(params[:id])
  end

  def update
  	@book = Book.find(params[:id])
  	if @book.update(book_params)
  	  redirect_to @book, notice: 'Book was successfully updated.'
    elsif
      render :edit
    end
  end

  def destroy
  	@book = Book.find(params[:id])
  	@book.destroy
  	redirect_to({action: :index}, notice: 'Book was successfully destroyed.')
  end

  private
  	def book_params
  		params.require(:book).permit(:title, :body)
    end
end
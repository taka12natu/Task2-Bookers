class BooksController < ApplicationController
  
   def index
  	@book = Book.new
  end

  def create
  	@book = Book.new(book_params)
  	if @book.save
  	redirect_to @book, notice: 'success!'
  	else
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
  	@book.update(book_params)
  	redirect_to book_path(@book)
  end

  def top
  end

  private
  	def book_params
  		params.require(:book).permit(:title, :body)
    end
end
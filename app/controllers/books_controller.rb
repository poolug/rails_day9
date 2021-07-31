class BooksController < ApplicationController

  before_action :set_book, only: %i[show]
  before_action :set_selects, only: %i[new create]

  def index
    @q = Book.ransack(params[:q])
    @books = @q.result(distinct: true)
  end

  def new
    @book = Book.new
  end

  def show
  end

  def create
    @book = Book.create(book_params)
    respond_to do |format|
      if @book.save
        format.html {redirect_to @book, notice: "El libro #{@book.title} ha sido creado exitosamente"}
      else
        format.html {render :new}
      end
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :author, :status, :lend_date, :return_date)
  end

  def set_book
    @book = Book.find(params[:id])
  end

  def set_selects
    @statuses = Book.statuses.keys
  end

end

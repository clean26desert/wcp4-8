class BooksController < ApplicationController
  def index
      @books = Book.all
      @book = Book.new
  end

  def create
    # ストロングパラメーターを使用
     book = Book.new(book_params)
    # DBへ保存する
     book.save
    # 新規投稿画面へリダイレクト
    redirect_to book_path(book)
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def destroy
    # ストロングパラメーターを使用
    book = Book.find(params[:id])
    # 対象をDBから破棄
    book.destroy
    # 一覧画面へリダイレクト
    redirect_to books_path
  end

  def update
    # ストロングパラメーターを使用
    book = Book.find(params[:id])
    # 対象をDBで更新
    book.update(book_params)
    # 新規投稿画面へリダイレクト
    redirect_to book_path(book)
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end

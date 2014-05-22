class BooksController < ApplicationController

	layout "headless", only: [:show, :index]
	before_action :admin_user, only: [:edit, :new]
	

	def new
		@book = Book.new
	end

	def create
		@book = Book.new(book_params)

		if @book.save
			redirect_to @book
		else
			render 'new'
		end
	end

	def show
		@book = Book.find(params[:id])
	end

	def index
		@books = Book.all
	end

	def edit
		@book = Book.find(params[:id])
	end

	def update
		@book = Book.find(params[:id])

		if @book.update(book_params)
			redirect_to @book
		else
			render 'edit'
		end
	end

	def destroy
		@book = Book.find(params[:id])

		@book.destroy

		redirect_to books_path
	end


	private
		def book_params
			params.require(:book).permit(:title, :creator, :publisher, :year, :image_path, :thumb)
		end

		def admin_user
			redirect_to(root_url) unless current_user.admin?
		end

end

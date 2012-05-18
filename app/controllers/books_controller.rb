class BooksController < ApplicationController
	skip_before_filter :check_login, :only =>:adminsignin
	def index
	end
	def adminsignin
		if request.post?
			@user=User.new(params[:user])
			if (@user.username == "suman" && @user.password == "password")
				session[:user_name]=@user.username
				redirect_to :controller=>"Books",:action=>"index"
			else
				if (@user.username == "")
				flash[:notice]="Username or Password can't be blank "
				else
				flash[:notice]="Username or Password is incorrect"
				end
			end
		end

	end

#	$token=""
#    def generate_token(length=8)
#    alphanumerics = ('a'..'z').to_a.concat(('A'..'Z').to_a.concat(('0'..'9').to_a))
#    self.token = alphanumerics.sort_by{rand}.to_s[0..length]

    # Ensure uniqueness of the token..
#    generate_token unless Book.find_by_token(self.token).nil?
# 	 end
   

	
	def new
		@book=Book.new
		alphanumerics = (Time.now.to_i).to_a.concat(('a'..'z').to_a.concat(('0'..'9').to_a).concat((('A'..'Z')).to_a))
		@book.sl_no = alphanumerics.sort_by{rand}.to_s[0..6]
	end
	def create
		@book=Book.new(params[:book])
		if @book.save
			flash[:notice]="Book added......."
			redirect_to :action=>"show"
		else
			respond_to do |format|
				format.html {render :action=>"new"}
				format.xml {render :xml=>@book.errors}
			end
		end
	end
	
	def edit
		@books=Book.find(:all)
	end

 	def update
		@book=Book.find(params[:id])
		if @book.update_attributes(params[:book])
			flash[:notice]="Book is updated Successfully........."
			redirect_to :action=>"edit"
		else
			respond_to do |format|
				format.html {render :action=>"edit"}
				format.xml {render :xml=>@book.errors}
			end
		end

	end

	def editbook
	
	@book=Book.find_by_id(params[:id])
	end
	
	def delete
		@book=Book.find(params[:id])
		if @book.destroy
		flash[:notice]="Product deleted successfully........."
		redirect_to :action=>"edit"
		end

	end

	def show
		@books=Book.find(:all);
	end

	def add
		@book=Book.find(params[:id])
		@book.user_id=session[:user_id]
		if @book.update_attributes(params[:book])
			flash[:notice]="Book is added Successfully........."
			redirect_to :controller=>"Users",:action=>"rentbook"
		end
	
	end
	

end

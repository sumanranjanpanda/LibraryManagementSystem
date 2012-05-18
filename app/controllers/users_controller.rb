class UsersController < ApplicationController
	prepend_before_filter :check , :only =>"mybook"


	def signin
		@user=User.new
#		@user.username="abcdef"
		if(cookies[:username])
			@user.username=cookies[:username]			
			@user.password=cookies[:password]
		end
		
		if request.post?
			@user=User.new(params[:user])
			user=User.find_by_username_and_password(@user.username,@user.password)
			puts user
			if user
				session[:user_id]=user.id
				session[:user_name]=user.name
				if (params[:remember])
					cookies[:username]={:value=>user.username,:expire=>1.hour.from_now}
					cookies[:password]={:value=>user.password, :expire=>1.hour.from_now}
				end
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

	def signout
		reset_session
		flash[:notice]="Signned out successfully..."
		redirect_to :action=>"signin"
	end
	def signup
		@user=User.new
	end
	def create
		@user=User.new(params[:user])
		if @user.save
			UserMailer::deliver_welcome_mail(@user)
			flash[:notice]="Congratulation #{session[:user_name]}.... You are now registered member of our library"
			redirect_to :controller=>"Users",:action=>"signin"
		else
			respond_to do |format|
				format.html {render :action=>"signup"}
				format.xml {render :xml=>@user.errors}
			end
		end
	end


	def mybook
		@books=Book.find_all_by_user_id(session[:user_id]);
			
	end


	def rentbook
		@books=Book.find(:all, :conditions=>["user_id != ?", session[:user_id]])

	end

	def profile
	
	@user=User.find_by_id(session[:user_id])
	
	end

	def edit
		@user=User.find_by_id(session[:user_id])
		
	end

 	def update
		@user=User.find(session[:user_id])
		if @user.update_attributes(params[:user])
			flash[:notice]="Book is updated Successfully........."
			redirect_to :action=>"profile"
		else
			respond_to do |format|
				format.html {render :action=>"edit"}
				format.xml {render :xml=>@book.errors}
			end
		end

	end


private
	def check
		@book=Book.find_all_by_user_id(session[:user_id]);
		if @book.blank? 
		redirect_to :controller=>"Blanks",:action=>"faq"
		end
	end


end

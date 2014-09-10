class UsersController < ApplicationController
  before_action :set_user,only: [:show,:edit,:update]
  def show
    #This will give instance variables. Page will display user details and also all his posts.
  end

  def update
      @user.nick = params[:user][:nick]
      @user.room = params[:user][:room]
      @user.hostel = params[:user][:hostel]
      @user.email = params[:user][:email]
      @user.contact = params[:user][:contact]
       if params[:user][:file_link]
      uploaded_io = params[:user][:file_link]
      File.open(Rails.root.join('app', 'assets','images', uploaded_io.original_filename), 'wb') do |file|
        file.write(uploaded_io.read)
      end
      @user.profile_picture = uploaded_io.original_filename
    end


      if @user.save
	  flash[:success]="User Profile updated successfully"
          redirect_to @user
      else
      	  render :edit
      end
  end

  def edit
  end

  def articles
    @user = current_user
    @posts = Post.where("user_id = ?", current_user.id)
  end
  private
    def set_user
      @user = current_user
      if @user.profile_picture == ""
        @picture = "user-default-blue.png"
      else
        @picture = @user.profile_picture
      end
    end

    def user_params 
      params.require(:user).permit(:nick,:room,:hostel,:email,:contact,:profile_picture)
    end

end

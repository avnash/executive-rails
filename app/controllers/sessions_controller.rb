class SessionsController < ApplicationController

  require 'net/ldap'

  def new
  end

  def create

    username = params[:session][:roll]
    password = params[:session][:password]
    #    if username == password
    #      session[:user] = username.upcase
    #      user = User.find_by_username(session[:user])
    #      session[:user_id] = user.id
    #      
    #    else
    #      redirect_to new_user_session_path, :flash => {:error => "Invalid username or password"}
    #    end

    if !username.match(/[a-zA-Z]{2}[0-9]{2}[a-zA-Z]{1}[0-9]{3}/)

      @user = User.find_by(username: username)

      k = @user.nil??false:@user.usertype == password
      if k  
        sign_in @user
        redirect_to :profile
        flash[:success] = "Welcome, #{@user[:fullname]}"
      else
        redirect_to signin_path
        flash[:error] = "Sorry, such a user does not exist in our database."
      end

    else
      ldap = Net::LDAP.new :host => "ldap.iitm.ac.in",
        :port => 389,
        :auth => {
          :method => :simple,
          :username => "cn=students,ou=bind,dc=ldap,dc=iitm,dc=ac,dc=in",
          :password => "rE11Bg_oO~iC"
        }

        if ldap.bind
          filter = Net::LDAP::Filter.eq("uid", username)
          treebase = "dc=ldap, dc=iitm, dc=ac, dc=in"

          ldap.search(:base => treebase, :filter => filter) do |entry|
            puts "DN: #{entry.dn}"
            if entry.dn
              ldap1 = Net::LDAP.new
              ldap1.host = "ldap.iitm.ac.in"
              ldap1.port = 389
              ldap1.auth entry.dn, password
              if ldap1.bind
                @user = User.find_by(username: params[:session][:roll])
                if @user
                  sign_in @user
                  redirect_to root_path
                  flash[:success] = "Welcome, #{@user[:fullname]}"
                else
                  redirect_to signin_path
                  flash[:error] = "Sorry, such a user does not exist in our database."
                end
              else
                redirect_to signin_path, :flash => {:error => "Invalid username or password"}
              end
            end
          end
        end
      end
  

  end

  def profile
    @user = current_user
    if @user.profile_picture == ""
      @picture = "/public/uploads/user-default-blue.png"
    else
      @picture = @user.profile_picture
    end
  end

  def destroy
    sign_out 
    redirect_to root_url
  end

end

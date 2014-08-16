class PostMailer < ActionMailer::Base
  	default from: "saikiranp321@gmail.com"
  
	def post_notify(user)
  		@user = user
		mail(to:'chiru6753@gmail.com',subject:'Welcome to feedback forum')
	end
end

class PostMailer < ActionMailer::Base
  	default from: "ch12b034@smail.iitm.ac.in"
  
	def post_notify(user)
  		@user = user
		mail(to:'chiru6753@gmail.com',subject:'Welcome to feedback forum')
	end
end

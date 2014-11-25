class SupportMailer < ActionMailer::Base
  
  default from: "from@example.com"

  def new_support(challenge, support)
  	@challenge = challenge
  	@support = support

  	mail(to: 'ferblape@gmail.com',
  		#sobreescribimos el default
  		from: 'myapp@algo.com', 
  		subject: "New support for #{challenge.title}")

  end

end
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

 	#el problema de este filtro es que cada vez que creas una acción nueva tienes que pensar si 
 	#necesitas o no la query, por temas de rendimiento
	before_filter :last_challenges

  	def last_challenges
		@last_challenges = Challenge.order("created_at DESC").limit(3)
	end

end

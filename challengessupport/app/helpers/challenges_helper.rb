module ChallengesHelper


	def previous_page?
		if params[:page].blank? || params[:page].to_i == 1
			false
		else
			true
		end
	end



end

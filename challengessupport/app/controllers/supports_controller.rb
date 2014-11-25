class SupportsController < ApplicationController

	def create

		@challenge = Challenge.find_by(id: params[:challenge_id])
		@support = @challenge.supports.new entry_params

		if @support.save entry_params
			flash[:notice] = "thx for support"
			SupportMailer.new_support(@challenge, @support).deliver
			redirect_to challenge_path(@challenge.id)
		else
			flash.now[:error] = "fatal error"
			render 'challenges/show'
		end

	end

	#strong parameters
	def entry_params
		params.require(:support).permit(:mail)
	end

end
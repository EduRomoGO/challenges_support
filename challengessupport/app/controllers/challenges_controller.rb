class ChallengesController < ApplicationController

	PER_PAGE = 10

	def index

		if params[:key_word].present?
			key_word = "%#{params[:key_word]}%"
			@challenges = Challenge.where("title ilike ?", key_word)
			@page = 1
		elsif params[:page]
			@challenges = Challenge.limit(PER_PAGE).offset( (params[:page].to_i-1)*PER_PAGE )
			@page = params[:page].to_i
		else
			@challenges = Challenge.all
			@page = 1
		end

	end

	def show
		@challenge = Challenge.find_by(id: params[:id])
		@support = @challenge.supports.new
	end

	def new
		@challenge = Challenge.new
	end

	def create
		@challenge = Challenge.new entry_params
		@challenge.save
		redirect_to challenges_path
	end

	def edit
		@challenge = Challenge.find params[:id]
	end

	def update

		@challenge = Challenge.find params[:id]

		if @challenge.update_attributes entry_params
			flash[:notice] = "challenge updated succesfully"
			redirect_to challenge_path(@challenge.id)
		else
			flash.now[:error] = "error updating challenge"
			render 'edit'
		end

	end

	#strong parameters
	private
	def entry_params
		params.require(:challenge).permit(:title, :description, :poster)
	end


end
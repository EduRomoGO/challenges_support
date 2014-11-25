class Support < ActiveRecord::Base
	belongs_to :challenge

	validates :mail, {presence: true,
					  uniqueness: true,
				      format: {with: /\A[a-zA-Z0-9]*@{1}[a-zA-Z]*\.{1}[a-zA-Z]{2,3}\z/} }

end
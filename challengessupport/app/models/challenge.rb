class Challenge < ActiveRecord::Base
	mount_uploader :poster, PosterUploader

	has_many :supports

	validates :title, {presence: true}
	validates :description, {presence: true}

end
class AddChallengeId < ActiveRecord::Migration
  def change
  	add_column :supports, :challenge_id, :integer
  end
end

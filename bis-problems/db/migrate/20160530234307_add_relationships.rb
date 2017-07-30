class AddRelationships < ActiveRecord::Migration
  def change
	add_reference :problems, :user, index: true
	add_reference :solutions, :user, index: true
	add_reference :solutions, :problem, index: true
  end
end

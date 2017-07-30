class Problem < ActiveRecord::Base
	has_many :solutions
	belongs_to :user
	validates :description, length: {
    minimum: 50,
    maximum: 800,
    too_short: "must have at least %{count} words",
    too_long: "must have at most %{count} words"
  }
  	validates :title, length: {
    minimum: 5,
    maximum: 100,
    too_short: "must have at least %{count} words",
    too_long: "must have at most %{count} words"
  }
  acts_as_votable
  def score
    self.get_upvotes.size - self.get_downvotes.size
  end
end

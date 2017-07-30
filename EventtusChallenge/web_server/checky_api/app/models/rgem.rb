class Rgem < ActiveRecord::Base
  has_many :informations
  has_many :systemlibs, :through => :informations
  has_many :osystems,   :through => :informations
  validates :name, presence: true
end

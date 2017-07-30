class Systemlib < ActiveRecord::Base
  has_many :informations
  has_many :rgems,      :through => :informations
  has_many :osystems,   :through => :informations
  validates :name, presence: true
end

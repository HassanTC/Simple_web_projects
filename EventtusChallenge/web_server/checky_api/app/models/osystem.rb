class Osystem < ActiveRecord::Base
  has_many :informations
  has_many :systemlibs, :through => :informations
  has_many :rgems,      :through => :informations
  validates :name, :install_code, presence: true

  def self.get_install_code name
    Osystem.find_by_name(name).try(:install_code)
  end
end

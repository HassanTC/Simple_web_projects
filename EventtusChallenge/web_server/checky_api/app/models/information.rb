class Information < ActiveRecord::Base
  belongs_to :osystem
  belongs_to :systemlib
  belongs_to :rgem
  validates :rgem_id, :uniqueness => { :scope => [:systemlib_id, :osystem_id]}
  validates :rgem_id, :systemlib_id, :osystem_id, presence: true



  class << self

    def search(gem_name, os_name)
      ids = get_ids(gem_name, os_name)
      if ids.size == 2
        joins(:systemlib)
        .where(rgem_id: ids[0] , osystem_id: ids[1])
        .pluck(:name)
      end
    end

    private
    def get_ids(gem_name, os_name)
      [Rgem.find_by_name(gem_name).try(:id),
       Osystem.find_by_name(os_name).try(:id)].compact
    end

  end

end

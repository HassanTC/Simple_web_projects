require 'rails_helper'

RSpec.describe Information, :type => :model do
  context "when create new tirnary table validations working" do
    it { should validate_uniqueness_of(:rgem_id).scoped_to(:systemlib_id, :osystem_id) }
    it { should validate_presence_of :rgem_id }
    it { should validate_presence_of :systemlib_id }
    it { should validate_presence_of :osystem_id}
  end
  context "when create a tirnary table the relations is exist" do
    it { should belong_to(:rgem) }
    it { should belong_to(:osystem) }
    it { should belong_to(:systemlib) }
  end

  context "when find by os name and gem name" do

    before(:each) do
      rgem = create(:rgem, name: "testing_gem")
      os   = create(:osystem, name: "testing_os")
      lib  = create(:systemlib, name: "testing_lib")
      info = create(:information,rgem_id: rgem.id,
                   osystem_id: os.id,
                   systemlib_id: lib.id)
    end

    it "return array of system libararies if sound" do
      systemlib = Information.search("testing_gem","testing_os")
      expect(systemlib).to eq ["testing_lib"]
    end

    it "return nil if not found" do
      systemlib = Information.search("o","x")
      expect(systemlib).to be_nil
    end
    
  end
end

require 'rails_helper'

RSpec.describe Osystem, :type => :model do
  context "when create new Operating System validations working" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :install_code }
  end
  context "when OS created it should has relations" do
    it { should have_many(:informations) }
    it { should have_many(:rgems).through(:informations) }
    it { should have_many(:systemlibs).through(:informations) }
  end
end

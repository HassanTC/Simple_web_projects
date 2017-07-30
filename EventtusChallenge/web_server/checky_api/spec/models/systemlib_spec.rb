require 'rails_helper'

RSpec.describe Systemlib, :type => :model do
  context "when create new System Libarary validations working" do
    it { should validate_presence_of :name }
  end
  context "when System Libarary created it should has relations" do
    it { should have_many(:informations) }
    it { should have_many(:osystems).through(:informations) }
    it { should have_many(:rgems).through(:informations) }
  end
end

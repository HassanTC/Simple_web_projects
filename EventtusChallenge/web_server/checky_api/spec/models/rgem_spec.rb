require 'rails_helper'

RSpec.describe Rgem, :type => :model do
  context "when create new ruby gem validations working" do
    it { should validate_presence_of :name }
  end
  context "when Gem created it should has relations" do
    it { should have_many(:informations) }
    it { should have_many(:osystems).through(:informations) }
    it { should have_many(:systemlibs).through(:informations) }
  end
end

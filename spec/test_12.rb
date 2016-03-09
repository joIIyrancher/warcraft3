require_relative 'spec_helper'

describe Footman do
  before :each do
    @footman = Footman.new
    #@peasant = Peasant.new
    #@super_saiyan = Unit.new(1000000, 11)
    @barracks = Barracks.new
  end

  describe "#attack!" do
    it "should damage barracks by half of its attack power" do
      @footman.attack!(@barracks)
      ## building HP (500) - footman AP (10)/2 # => 495
      expect(@barracks.health_points).to eq(495)
    end
  end
end
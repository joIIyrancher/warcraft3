require_relative 'spec_helper'

describe Barracks do
  before :each do
    @footman = Footman.new
    #@peasant = Peasant.new
    @super_saiyan = Unit.new(1000000, 499)
    @barracks = Barracks.new
  end

  describe "#new" do
    it "should create a new barracks with hp of 500" do
      expect(@barracks.health_points).to eq(500)
    end
  end

  describe "#damage" do
    it "should reduce barracks' health_points by given attack power" do
      @super_saiyan.attack!(@barracks)

      ## building HP (500) - super_saiyan AP (499) # => 1
      expect(@barracks.health_points).to eq(1)
    end
  end

  
end
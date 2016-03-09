require_relative 'spec_helper'

describe SiegeEngine do
  describe "#new" do
    it "should return HP, AP" do
      siege = SiegeEngine.new
      expect(siege.health_points).to eq(400)
      expect(siege.attack_power).to eq(50)
    end
  end

  describe "#attack!" do
    it "should do double damage to barracks" do
      siege = SiegeEngine.new
      barracks = Barracks.new
      siege.attack!(barracks)
      expect(barracks.health_points).to eq(400)
    end
    it "should do regular damage to another siege" do
      siege1 = SiegeEngine.new
      siege2 = SiegeEngine.new
      siege1.attack!(siege2)
      expect(siege2.health_points).to eq(350)
    end
    it "should not attack non-siege units" do
      siege = SiegeEngine.new
      peasant = Peasant.new
      footman = Footman.new
      siege.attack!(peasant)
      siege.attack!(footman)
      expect(peasant.health_points).to eq(35)
      expect(footman.health_points).to eq(60)
    end
  end
end
require_relative 'spec_helper'

describe Unit do
  before :each do
    @super_saiyan = Unit.new(1000000, 500)
    @barracks = Barracks.new
  end

  describe "#dead?" do
    it "should return false if health_points is greater than 0" do
      alive_unit = Unit.new(50, 10)
      # unit (50HP)
      expect(alive_unit.dead?).to eq(false)
    end
    it "should return true if health_points is equal to 0" do
      dead_unit = Unit.new(0, 10)
      # unit (0HP)
      expect(dead_unit.dead?).to eq(true)
    end
  end

  describe "attack_attempt?" do
    it "should return true if both units are not dead" do
      unit_A = Unit.new(50, 2)
      unit_B = Unit.new(50, 2)
      expect(unit_A.attack_attempt?(unit_B)).to eq(true)
    end

    it "should return false if attacker is dead" do
      unit_A = Unit.new(0, 2)
      unit_B = Unit.new(50, 2)
      expect(unit_A.attack_attempt?(unit_B)).to eq(false)
    end

    it "should return false if receiver is dead" do
      unit_A = Unit.new(50, 2)
      unit_B = Unit.new(0, 2)
      expect(unit_A.attack_attempt?(unit_B)).to eq(false)
    end

    it "should return false if both are dead" do
      unit_A = Unit.new(0, 2)
      unit_B = Unit.new(0, 2)
      expect(unit_A.attack_attempt?(unit_B)).to eq(false)
    end   
  end
end
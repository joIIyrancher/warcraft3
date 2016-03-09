# http://classic.battle.net/war3/human/units/footman.shtml
require_relative 'unit'

class Footman < Unit
  def initialize
    super(60, 10)
  end

  def attack!(building)
    attack = self.attack_power
    if building.class == Barracks
      attack = (attack/2).ceil
    end
    building.damage(attack)
  end
end


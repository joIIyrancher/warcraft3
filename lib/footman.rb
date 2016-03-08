# http://classic.battle.net/war3/human/units/footman.shtml

class Unit
  attr_accessor :health_points, :attack_power

  def initialize(health_points, attack_power)
    @health_points = health_points
    @attack_power = attack_power
    # Need to default the 2 instance variables here
    # Also also give code outside this class access to these variables (via attr_reader, attr_writer or attr_accessor)
    def damage(power)
      self.health_points -= power
      self.health_points
    end

    def attack!(enemy)
      enemy.damage(self.attack_power)
    end
  end


end

class Footman < Unit

  def initialize
    super(60, 10)
  end


end

class Peasant < Unit
  def initialize
    super(35, 0)
  end
end

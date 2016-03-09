# http://classic.battle.net/war3/human/units/footman.shtml

class Unit
  attr_reader :health_points, :attack_power

  def initialize(health_points, attack_power)
    @health_points = health_points
    @attack_power = attack_power

    # Need to default the 2 instance variables here
    # Also also give code outside this class access to these variables (via attr_reader, attr_writer or attr_accessor)
    def damage(power)
      @health_points -= power
    end

    def attack!(enemy)
      enemy.damage(self.attack_power)
    end

    def dead?
      @health_points <= 0
    end

    # def attacker_receiver_dead?(enemy)
    #   self.dead? and enemy.dead? 
    # end    
    def attack_attempt?(enemy)
      valid_attack = true
      if self.health_points <= 0 or enemy.health_points <= 0
        valid_attack = false
      end
      valid_attack
    end
  end
end



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

class Peasant < Unit
  def initialize
    super(35, 0)
  end
end

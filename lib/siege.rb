require_relative 'footman'

class SiegeEngine < Unit

  def initialize
    super(400, 50)
  end

  def attack!(enemy)
    attack = self.attack_power
    if enemy.class == Barracks
      attack = (attack*2).ceil
      enemy.damage(attack)
    elsif enemy.class == SiegeEngine
      enemy.damage(attack)
    else
      nil
    end
  end
end
require_relative 'footman'

FOOTMAN_GOLD_COST = 135
FOOTMAN_FOOD_COST = 2
PEASANT_GOLD_COST = 90
PEASANT_FOOD_COST = 5

class Barracks
  attr_reader :gold, :food
  
  def initialize
    @gold = 1000
    @food = 80
    @footmen = []
    @peasants = []
  end

  def can_train_footman?
    self.food >= FOOTMAN_FOOD_COST and self.gold >= FOOTMAN_GOLD_COST
  end

  def can_train_peasant?
    self.food >= PEASANT_FOOD_COST and self.gold >= PEASANT_GOLD_COST
  end


  def train_footman
    if can_train_footman?
      @gold -= FOOTMAN_GOLD_COST
      @food -= FOOTMAN_FOOD_COST

      new_footman = Footman.new
      @footmen << new_footman
      new_footman
    end
  end



  def train_peasant
    if can_train_peasant?
      @gold -= PEASANT_GOLD_COST
      @food -= PEASANT_FOOD_COST

      new_peasant = Peasant.new
      @peasants << new_peasant
      new_peasant
    end
  end
end

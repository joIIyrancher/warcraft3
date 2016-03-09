require_relative 'footman'

FOOTMAN_GOLD_COST = 135
FOOTMAN_FOOD_COST = 2
PEASANT_GOLD_COST = 90
PEASANT_FOOD_COST = 5
SIEGE_GOLD_COST = 200
SIEGE_FOOD_COST = 3
SIEGE_LUMBER_COST = 60
BARRACKS_HEALTH_POINTS = 500

class Barracks
  attr_reader :gold, :food, :health_points, :lumber
  
  def initialize
    @health_points = BARRACKS_HEALTH_POINTS
    @gold = 1000
    @food = 80
    @lumber = 500
    @footmen = []
    @peasants = []
    @sieges = []
  end

  def can_train_footman?
    self.food >= FOOTMAN_FOOD_COST and self.gold >= FOOTMAN_GOLD_COST
  end

  def can_train_peasant?
    self.food >= PEASANT_FOOD_COST and self.gold >= PEASANT_GOLD_COST
  end

  def can_train_siege?
    self.food >= SIEGE_FOOD_COST and self.gold >= SIEGE_GOLD_COST and self.lumber >= SIEGE_LUMBER_COST
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

  def train_siege
    if can_train_siege?
      @gold -= SIEGE_GOLD_COST
      @food -= SIEGE_FOOD_COST
      @lumber -= SIEGE_LUMBER_COST

      new_siege = SiegeEngine.new
      @sieges << new_siege
      new_siege
    end
  end

  def damage(power)
    @health_points -= power
  end
end

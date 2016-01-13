class Weapon < Item

  attr_accessor :damage, :range

  def initialize(name, weight, damage, range)
    @name = name
    @weight = weight
    @damage = damage
    @range = range
  end

  def hit(robot)
    robot.wound(@damage)
  end

  def bomb(robot)
    robot.wound(@damage)
  end
end

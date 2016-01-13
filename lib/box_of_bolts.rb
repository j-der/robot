class BoxOfBolts < Item

  HEAL_AMOUNT = 20

  attr_accessor :name, :weight

  def initialize
    super("Box of bolts", 25)
  end

  def feed(robot)
    robot.heal(HEAL_AMOUNT)
  end

end

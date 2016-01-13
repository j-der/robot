class Robot

  attr_reader :position, :items, :health
  attr_accessor :equipped_weapon, :health

  MAX_CAPACITY = 250
  MAX_HEALTH = 100
  DEFAULT_DAMAGE = 5

  def initialize
    @position = [0, 0]
    @items = []
    @items_weight = 0
    @health = 100
  end

  def move_left
    position[0] -= 1
  end

  def move_right
    position[0] += 1
  end

  def move_up
    position[1] += 1
  end

  def move_down
    position[1] -= 1
  end

  def pick_up(item)
    if items_weight < MAX_CAPACITY
      items << item
    end
    if item.is_a? Weapon
      @equipped_weapon = item
    end
    if (item.is_a? BoxOfBolts) && (health <= 80)
      item.feed(self)
    end
  end

  def items_weight
    total_weight = 0
    items.each do |obj|
      total_weight += obj.weight
    end
    total_weight
  end


  def heal(hp)
    if health < 100
      @health += hp
    end
  end

  def wound(damage)
    if (@health - damage) < 0
      @health = 0
    else
      @health -= damage
    end
  end

  def can_attack?(robot)
    if robot.position[0] == self.position[0] += 1 || self.position[0] -= 1
      true
    elsif robot.position[1] == self.position[1] += 1 || self.position[1] -= 1
      true
    else
      false
    end
  end

  def can_attack_with_grenade?(robot)
    if robot.position[0] == self.position[0] += 2 || self.position[0] -= 2
      true
    elsif robot.position[1] == self.position[1] += 2 || self.position[1] -= 2
      true
    else
      false
    end
  end

  def attack(robot)
    if can_attack?(robot)
      if equipped_weapon
        @equipped_weapon.hit(robot)
      else
      robot.wound(DEFAULT_DAMAGE)
      end
    elsif can_attack_with_grenade?(robot)
      if equipped_weapon = @grenade
        @grenade.hit(robot)
      end
    end
  end

   def heal!(meds)
    if @health == 0
      raise "Robot is dead! You can't rise from the dead!"
    end
  end

  def attack!(thing)
    if thing != Robot.new
      raise "Attack failed. You can only attack a robot!"
    end
  end


end

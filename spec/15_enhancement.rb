require 'pry'
require_relative 'spec_helper'

describe Robot do
  before :each do
    @robot = Robot.new
    @robot2 = Robot.new
    @laser = Laser.new
  end

  describe "#heal!" do
    it "should not heal itself if health is 0" do
      # binding.pry

      @robot.wound(100)
      expect(@robot.health).to eq(0)
      expect { @robot.heal!(20) }.to raise_error("Robot is dead! You can't rise from the dead!")
      # expect(@robot.health).to eq(20)
    end
  end

  describe "#attack!" do
    it "should not attack unless it is attacking a robot" do
      expect { @robot2.attack!(@laser) }.to raise_error("Attack failed. You can only attack a robot!")
      expect(@laser).not_to receive(:attack!)
    end
  end
end

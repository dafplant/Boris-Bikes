require_relative 'bike'

class DockingStation
  DEFAULT_CAPACITY = 20

  def initialize
    @bikes = []
  end

  def release_bike
    fail 'No bikes available' if empty?
    @bikes.pop
  end

  def dock(bike)
    fail 'Docking station is full' if full?
    @bikes << bike
    bike
  end

private
def full?
  @bikes.length >= DEFAULT_CAPACITY
end

private
def empty?
  @bikes.length < 1
end

end

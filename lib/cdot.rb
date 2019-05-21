class Cdot
  attr_reader :intersections

  def initialize
    @intersections = []
  end

  def add_intersection(intersection)
    @intersections << intersection
  end

  def tickets
    data = Hash.new(0)
    @intersections.each do |intersection|
      intersection.speeding_drivers.each do |driver|
        data[driver] += 1
      end
    end
    data
  end

  def driver_balance(driver)
    total_fine = 0
    tickets[driver].times do |i|
      total_fine += 100
    end
    total_fine *= 2 if total_fine > 100
    total_fine
  end
end

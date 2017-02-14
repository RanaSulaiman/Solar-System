
# Creating a Planet class
class Planet
  attr_reader :name, :diameter, :mass, :moons, :distance, :rotation

  def initialize(parameters = {})
    @name = parameters[:p_name]
    @mass = parameters[:p_mass]
    @diameter = parameters[:diameter]
    @moons = parameters[:moons]
    @distance = parameters[:distance]
  #  @rotation = parameters[:rotation]
  end

  def info
    puts "Planet: #{@name}, has a mass of #{@mass} million tons, diameter of #{@diameter} miles, #{@moons} moon(s), #{@distance} million miles away from the Sun"
  end

end

# Creating a SolarSystem class
class SolarSystem

  attr_reader :name, :planets

  def initialize(name, planets = [])
    @name = name
    @planets = planets
  end

  def add_one_planet(new_planet)
    @planets << new_planet
  end

  def add_multiple_planets(new_planets)
    new_planets.each do |new_planet|
      @planets << new_planet
    end
  end

  def print_solar_system_info
    puts "Solar System name is #{@name} and has #{@planets.length} planets"
    @planets.each do |planet|
      planet.info
    end
  end
end

#print planets

def print_information(planets)
# Printing the list for user to select from
  puts "Which planet would you like to learn about"
  puts "Enter the number of the planet from the following list"
  counter = 1
  planets.each do |planet|
    puts counter.to_s + ": " + planet.name
    counter += 1
  end
  puts counter.to_s + ": Exit"

# Providing the user with informatiion about the selected planet
  print "Enter your choice number > "
  user_choice = gets.chomp.to_i
  exit_counter = counter
  while user_choice != exit_counter

    options = *(1...counter)
    if options.include? (user_choice)
      planets[user_choice-1].info
      print "Enter number of planet you like to learn about > "
      user_choice = gets.chomp.to_i
    else
      print "Invalid choice,enter number from the list > "
      user_choice = gets.chomp.to_i
    end
  end

end

# Creating planets instances
mercury = Planet.new({p_name: "Mercury", p_mass: 999, diameter: 3100, moons: 0, distance: 110})

venus = Planet.new({p_name: "Venus", p_mass: 991, diameter: 7500, moons: 1, distance: 1670})

earth = Planet.new({p_name: "Earth", p_mass: 679, diameter: 1010, moons: 1, distance: 2020})

jupiter = Planet.new({p_name: "Jupiter", p_mass: 830, diameter: 1010, moons: 4, distance: 3000})

saturn = Planet.new({p_name: "Saturn", p_mass: 455, diameter: 1010, moons: 5, distance: 2700})

uranus = Planet.new({p_name: "Uranus", p_mass: 1056, diameter: 1010, moons: 2, distance: 1980})

neptune = Planet.new({p_name: "Neptune", p_mass: 779, diameter: 1010, moons: 1, distance: 2456})

pluto = Planet.new({p_name: "Pluto", p_mass: 678, diameter: 1010, moons: 0, distance: 1778})

# Store the list of instances in planets array
planets = []
planets.push(mercury, venus, earth, jupiter, saturn, uranus, neptune, pluto)

# printing planets information
print_information(planets)

# Creating our_sun instance
our_sun = SolarSystem.new("Our Sun", planets)
puts "=" * 100
# Printing the instance information
our_sun.print_solar_system_info
puts "=" * 100

# Creating a new planet instance
new_planet = Planet.new({p_name: "New Planet 1", p_mass: 910, diameter: 1010, moons: 1, distance: 2000})

#  Adding new planet to the existing list
# and printin the updated our_sun instance
our_sun.add_one_planet(new_planet)
puts "=" * 100

our_sun.print_solar_system_info
puts "=" * 100

# Creating a new list of planets
new_planets = []
new_planets << Planet.new({p_name: "New Planet 2", p_mass: 920, diameter: 1011, moons: 0, distance: 1446})
new_planets << Planet.new({p_name: "New Planet 3", p_mass: 930, diameter: 1110, moons: 3, distance: 1779})
new_planets << Planet.new({p_name: "New Planet 4", p_mass: 940, diameter: 1310, moons: 2, distance: 1784})

#  Adding the new list of planets to existing list
# and printin the updated our_sun instance
our_sun.add_multiple_planets(new_planets)
puts "=" * 100

our_sun.print_solar_system_info
puts "=" * 100

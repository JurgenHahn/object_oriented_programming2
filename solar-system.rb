class System
  attr_reader :bodies

  def self.all_systems
    @@all_systems
  end

  @@all_systems = []

  def initialize
    @bodies = []
    @@all_systems.push(self)
  end

  def self.galactic_mass
    all_mass = 0
    all_systems.each do |system|
      all_mass += system.total_mass.to_i
    end
    return all_mass
  end

  def add(new_body)
    @bodies.each do |body|
      if new_body.name == body.name
        puts "Sorry, that name is taken!"
        return
      end
    end
    @bodies.push(new_body)
  end

  def total_mass
    total_mass = 0
    @bodies.each do |body|
      total_mass += body.mass
    end
    return total_mass
  end

end

class Body
  attr_reader :name, :mass

  def initialize(name, mass)
    @name = name
    @mass = mass
  end
end

class Planet < Body

  def initialize(name, mass, day, year)
    super(name, mass)
    @day = day
    @year = year
  end

  def self.all(system)
  all_planets = []
    system.bodies.each do |body|
      if body.class == Planet
        all_planets.push(body)
      end
    end
  return all_planets
  end

end

class Star < Body

  def initialize(name, mass, type)
    super(name, mass)
    @type = type
  end

  def self.all(system)
  all_stars = []
    system.bodies.each do |body|
      if body.class == Star
        all_stars.push(body)
      end
    end
  return all_stars
  end

end

class Moon < Body

  def initialize(name, mass, month, planet)
    super(name, mass)
    @month = month
    @planet = planet
  end

  def self.all(system)
  all_moons = []
    system.bodies.each do |body|
      if body.class == Moon
        all_moons.push(body)
      end
    end
  return all_moons
  end

end

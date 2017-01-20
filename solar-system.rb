class System
  attr_reader :bodies

  @@all_systems = []
    def self.all_systems
      @@all_systems
    end

    def self.galactic_mass
      all_mass = 0
      all_systems.each do |system|
        all_mass += system.total_mass.to_i
      end
    return all_mass

    end


  def initialize
    @bodies = []
    @@all_systems.push(self)
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



    #create an array of all systems
    #iterate through all the systems and run total_mass
    #then store each result in an array and return the sum

end

class Body
  attr_reader :name, :mass

  def initialize(name, mass)
    @name = name
    @mass = mass

  end

end

class Planet < Body


  def self.all(system)

    all_planets = []

    system.bodies.each do |body|
      if body.class == Planet
        all_planets.push(body)
      end
    end
    return all_planets
  end

  def initialize(name, mass, day, year)
      super(name, mass)
      @day = day
      @year = year
  end

end

class Star < Body

  def self.all(system)

    all_stars = []

    system.bodies.each do |body|
      if body.class == Star
        all_stars.push(body)
      end
    end
    return all_stars
  end

  def initialize(name, mass, type)
      super(name, mass)
      @type = type

  end

end

class Moon < Body

  def self.all(system)

    all_moons = []

    system.bodies.each do |body|
      if body.class == Moon
        all_moons.push(body)
      end
    end
    return all_moons
  end

  def initialize(name, mass, month, planet)
      super(name, mass)
      @month = month
      @planet = planet
  end

end

class Owner
  # code goes here
  @@all = []
  attr_reader :name, :species

  def initialize(name)
    @name = name
    @species = "human"
    @cats = []
    @dogs = []
    @@all << self
  end

  def say_species
    "I am a human."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all.clear
  end

  def cats
    
    @cats
  end

  def dogs
    @dogs
  end

  def buy_cat(name)
    Cat.new(name, self)

  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    @dogs.map do |dog|
      dog.mood = "happy"
    end
  end
    def feed_cats
      @cats.map do |cat|
       cat.mood = "happy"
    end
  end 

  def sell_pets
    @cats.map do |cat|
      cat.mood = "nervous"
      cat.owner = nil
      
     
    end
    @dogs.map do |dog|
      dog.mood = "nervous"
      dog.owner = nil
      
      
    end
    @cats = []
    @dogs = []

  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."

  end

end
class Owner
  attr_reader :name, :species
  attr_accessor :pets

  @@all = []


  @@count = 0

  def initialize(name)
    @species = "human"
    @name = name
    @pets = {:cats => [], :dogs => []}
    @@all << self
    @@count += 1
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

  def walk_dogs
    @pets[:dogs].each {|dog| dog.mood = "happy"}
  end

  def feed_cats
    @pets[:cats].each {|cat| cat.mood = "happy"}
  end

  def sell_pets
    @pets[:cats].each {|cat| cat.mood = "nervous"}
    @pets[:dogs].each {|dog| dog.mood = "nervous"}
    @pets[:dogs].each {|dog| dog.owner = nil}
    @pets[:cats].each {|cat| cat.owner = nil}
    @pets.clear
  end

  def buy_cat(name)
    new_cat = Cat.new(name, self)
  end

  def buy_dog(name)
    new_dog = Dog.new(name, self)
  end

  def cats 
    #@pets[:cats]
    Cat.all.select {|cat| cat.owner == self}
  end

  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end

  def say_species
    "I am a #{@species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@count
  end

  def self.reset_all
    @@all = []
    @@count = 0
  end

end
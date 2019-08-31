class Owner
  # code goes here
  attr_reader :species, :name
  @@all = []
  @@count = 0

  def initialize(name)
    @species = "human"
    @name = name
    save
    @@count += 1
    @pets = {:dogs => [], :cats => [] }
  end

  def say_species
    "I am a #{@species}."
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.count
    @@count
  end

  def self.reset_all
    @@all.clear
  end

  def cats
    Cat.all.select {|cat| cat.owner == self}
  end

  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end

  def buy_cat(name)
    cat = Cat.new(name)
    @pets[:cats] << cat
  end

  def buy_dog(doggo)
    dog = Dog.new(doggo)
    @pets[:dogs] << dog
  end

  def walk_dogs
    @pets[:dogs].each {|o| o.mood = "happy"}
  end

  def feed_cats
    self.pets[:cats].each {|cat| cat.mood = "happy"}
  end

  def list_pets
    "I have #{@pets[:dogs].size} dog(s), and #{@pets[:cats].size} cat(s)."
  end

end

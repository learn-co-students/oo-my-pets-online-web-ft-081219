require 'pry'
class Owner
  attr_reader :name, :species
  attr_accessor :owner, :cats, :dogs

  @@all = []

  def initialize(name, species= "human")
    @name = name
    @species = species
    @cats = []
    @dogs = []
    self.save
  end

  def save
    @@all << self
  end

  def species
    @species
  end

  def say_species
    p "I am a human."
  end

  def self.all
    @@all
end

def self.count
  @@all.count
end

def self.reset_all
  @@all.clear
end

def cats
  Cat.all.select{|cat| cat.owner == self}
end

def dogs
  Dog.all.select{|dog| dog.owner == self}
end

def buy_cat(name)
  @cats << Cat.new(name, self)
end

def buy_dog(name)
  @dogs << Dog.new(name, self)
end

def walk_dogs
  dogs.select{|dog| dog.mood = "happy"}
end 

def feed_cats
  cats.select{|cat| cat.mood = "happy"}
end

def sell_pets
  dogs.each do |dog|
    dog.mood = "nervous"
    dog.owner = nil
  end
  cats.each do |cat|
    cat.mood = "nervous"
    cat.owner = nil
  end
end

def list_pets
  "I have #{dogs.size} dog(s), and #{cats.size} cat(s)."
end
end
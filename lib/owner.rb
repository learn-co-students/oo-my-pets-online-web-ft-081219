require 'pry'
class Owner
  attr_reader :name, :species
  
  @@all= []
  def initialize(name)
    @name = name 
    @species = "human"
    @cat = []
    @dog = []
    @@all << self 
  end 
  
  def say_species
    @owner = "I am a human."
  end 
  
  def self.all
    @@all
  end 
  
  def self.count
    @@all.count
  end 
  
  def self.reset_all
    @@all = []
  end

  def cats 
    @cat
  end 
  
  def buy_cat(name)
    Cat.new(name, self)
  end 
  
  def dogs
    @dog
  end 
  
  def buy_dog(name)
    Dog.new(name, self)
  end
  
  def walk_dogs
    Dog.all.each do |dogs|
    dogs.mood = "happy" 
    end
    #binding.pry
  end 
  
  def feed_cats
    Cat.all.each do |cats|
      cats.mood ="happy"
    end
  end 
  
  def sell_pets
    
    Dog.all.each do |dogs|
    dogs.mood = "nervous"
    dogs.owner = nil
  
    end 
    
    Cat.all.each do |cats|
    cats.mood = "nervous"
    cats.owner = nil
    end 
    
    dogs.clear
    cats.clear
  end 

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
    #binding.pry
  end 

end
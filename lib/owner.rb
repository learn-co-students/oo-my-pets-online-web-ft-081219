require "pry" 
class Owner
  
  attr_accessor :pets, :cat, :dog 
  attr_reader :name, :species 
  @@all = []
  
  def initialize(name)
    @name = name 
    @species = "human"
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
    Cat.all.select {|cat| cat.owner == self}
  end
  
  def buy_cat(name)
    Cat.new(name, self) 
  end 
  
  def feed_cats
    self.cats.each {|f| f.mood = "happy"}
  end 
  
  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end
  
  
  def buy_dog(name)
    Dog.new(name, self)
  end 
  
  def walk_dogs
    self.dogs.each {|w| w.mood = "happy"}
  end 
  
  def sell_pets
    # binding.pry 
    @pets = self.dogs + self.cats 
        @pets.each do |pet| 
        pet.mood = "nervous"
        pet.owner = nil 
    end 
  end 
  
  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end 
end
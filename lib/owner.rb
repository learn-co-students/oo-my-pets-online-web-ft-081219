require "pry" 
class Owner
  
  attr_accessor :pets
  attr_reader :name, :species 
  @@all = []
  
  def initialize(name)
    @name = name 
    @species = "human"
    @@all << self 
    @cat = []
    @dog = []
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
  
  def feed_cats
    self.cats.each {|f| f.mood = "happy"}
  end 
  
  def dogs 
    @dog 
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
        # pet.owner.pets.clear
    end 
    # @pets.clear 
  end 

end
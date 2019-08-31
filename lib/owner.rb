require 'pry'

class Owner
  # code goes here
  attr_accessor :cats, :dogs
  attr_reader :name, :species
 
  @@all =[]
  
  def initialize(name, species = "human")
    @name = name
    @species = species
    @cats = []
    @dogs =[]
    @@all << self
  end
 
  def say_species
    "I am a #{@species}."
  end 
  
  #owner instance methods
  def cats 
      #Cat.all.select{|cat| cat.owner == self}
      @cats
  end
  
  def dogs 
     #Dog.all.select{|dog| dog.owner == self}
     @dogs
  end
  
  def buy_cat(name)
    a_cat = Cat.new(name, self)
    #binding.pry
  end
  
  def buy_dog(name)
    a_dog = Dog.new(name, self)
  end
  
  def walk_dogs
    self.dogs.map{|dog| dog.mood = "happy"}
  end  
  
  def feed_cats
    self.cats.each{|cat| cat.mood = "happy"}
  end
  
  def sell_pets
    pet_list = self.dogs + self.cats
    pet_list.each do |pet|
      pet.mood = "nervous"
      pet.owner = nil
    end
    self.cats = []
    self.dogs = []
    #binding.pry
  end 
  
  def list_pets
    return "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
  
  #class methods
  def self.all
    @@all
  end
  
  def self.count
    self.all.size
  end
  
  def self.reset_all
    @@all.clear
  end
end

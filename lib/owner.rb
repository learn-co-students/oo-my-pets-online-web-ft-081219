require 'pry'

class Owner
 attr_reader :name
 attr_accessor :pets

 @@all = []
@@pets = {:dogs => [], :cats => []}

 def initialize(name, species = "human")
  @name = name
  @species = species
  @@all << self
 end 

 def species
  @species = "human"
 end

 def say_species 
    return "I am a #{species}."
 end

 def self.all
  @@all
 end

 def self.count
  @@all.size
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

 def buy_cat(cat_name)
  @@pets[:cats] << Cat.new(cat_name, self)
 end

 def buy_dog(dog_name)
  @@pets[:dogs] << Dog.new(dog_name, self)
 end

 def walk_dogs
    self.dogs.each {|dog| dog.mood = "happy"}
 end

 def feed_cats
    self.cats.each {|cat| cat.mood = "happy"}
 end

#  def sell_pets
#   pets = self.dogs + self.cats   
#   @@pets.each do |type, animals|
#       animals.each {|animal| animal.mood = "nervous"}
#     end
    
#  end

def sell_pets
    pets = self.dogs + self.cats

    pets.each do |pet|
      pet.mood = "nervous"
      pet.owner = nil
    end
  end 
end
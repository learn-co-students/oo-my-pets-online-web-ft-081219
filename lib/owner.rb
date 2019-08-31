require "pry"
class Owner
 attr_reader :name
 attr_accessor :pets

 @@all = []
 @@pets = {:dogs => [], :cats => []}

 def initialize(name, species = "human")
  @name = name
  @species = species
  @@all << self
  @pets = {:dogs => [], :cats => []}
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
    Dog.all.each do |dog|
    dog.mood = "happy"
  end
end 
 
 def feed_cats
   Cat.all.each do |cat|
     cat.mood = "happy"
  end 
end   

def sell_pets
  Cat.all.each do |cat|
    cat.mood = "nervous"
  end
  Dog.all.each do |dog| 
    dog.mood = "nervous"
  end 
   Dog.all.each do |dog| 
     dog.owner = nil
 end 
   Cat.all.each do |cat| 
     cat.owner = nil
 end 
end 

 def list_pets
   "I have #{Dog.all.size / 10} dog(s), and #{Cat.all.size / 10} cat(s)."
   
 end 

  
  
  

end 

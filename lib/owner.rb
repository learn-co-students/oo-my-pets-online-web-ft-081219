class Owner 
  
  attr_reader :name 
  
  @@all = []
  @@pets = {:dog => [], :cat =>[]}
  
  
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
    return @@all.count 
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
  
  def buy_cat(cat_name)
    @@pets[:cat] << Cat.new(cat_name, self)
  end
  
  def buy_dog(dog_name)
    @@pets[:dog] << Dog.new(dog_name, self)
  end
  
  def walk_dogs
    self.dogs.each do |dog|
      dog.mood = "happy"
    end
  end
  
  def feed_cats
    self.cats.each do |cat|
      cat.mood = "happy"
    end
  end
  def sell_pets
    pets = self.dogs + self.cats 

    pets.each do |pet|
      pet.mood = "nervous"
      pet.owner = nil 
    end
    @@pets.each do |val1, val2|
      val2.clear
    end
  end
  
  def list_pets
    return "I have #{@@pets[:dog].count} dog(s), and #{@@pets[:cat].count} cat(s)."
  end
end
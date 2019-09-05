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
  
  def feed_cats
    if @cats = "feed_cats"
      cats.mood ="happy"
    end
  end 
  
  def dogs
    @dog
  end 
  
  def buy_dog(name)
    Dog.new(name, self)
  end
  

end
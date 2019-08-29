require 'pry'

class Owner
  # code goes here
  attr_accessor :cats, :dogs
  attr_reader :name, :species
  @@all=[]

  def initialize(name)
    @name=name
    @species="human"
    @cats=[]
    @dogs=[]
    self.class.all.push(self)
  end

  def say_species
    "I am a human."
  end

  def self.all
    @@all
  end

  def self.count
    self.all.length
  end

  def self.reset_all
    @@all.clear
  end

  #ASSOCIATIONS

  def buy_cat(cat_n)
    self.cats.push(Cat.all.find {|c|c.name==cat_n})
  end

  def buy_dog(dog_n)
    if Dog.all.find {|d|d.name==dog_n}
      self.dogs.push(Dog.all.find {|d|d.name==dog_n})
    else
      Dog.new(dog_n,self)
    end
  end

  def walk_dogs
    self.dogs.each {|d|d.mood="happy"}
  end

  def feed_cats
    self.cats.each {|c|c.mood="happy"}
  end

  def sell_pets
    self.cats.each do |c|
      c.mood="nervous"
      c.owner=nil
    end
    self.cats.clear
    self.dogs.each do |d|
      d.mood="nervous"
      d.owner=nil
    end
    self.dogs.clear
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end
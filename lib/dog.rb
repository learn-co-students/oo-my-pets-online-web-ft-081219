class Dog
  attr_accessor :owner, :mood
  attr_reader :name

  @@all = []
  @@count = 0

  def initialize(name, owner)
    @name = name
    @owner = owner 
    @mood = "nervous"
    @@all << self
    @@count += 1
    @owner.pets[:dogs] << self
  end


  def self.all 
    @@all
  end


end
class Dog
  # code goes here
  attr_writer :mood, :owner
  attr_reader :name, :owner, :mood
  @@all = []

  def initialize(name, owner)
    @name = name
    @owner = owner
    @mood = "nervous"
    @@all << self
  end

  def self.all
    @@all
  end
end

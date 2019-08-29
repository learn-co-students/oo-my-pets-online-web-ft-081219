class Dog
  # code goes here
  attr_accessor :owner, :mood
  attr_reader :name
  @@all=[]

  def initialize(name, owner_n)
    @name=name
    @owner=owner_n
    owner_n.dogs.push(self)
    @mood="nervous"
    self.class.all.push(self)
  end

  def self.all
    @@all
  end

  #ASSOCIATIONS



end
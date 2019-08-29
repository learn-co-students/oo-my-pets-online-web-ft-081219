class Cat
  # code goes 
  attr_accessor :owner, :mood
  attr_reader :name
  @@all=[]

  def initialize(name, owner_n)
    @name=name
    @owner=owner_n
    owner_n.cats.push(self)
    @mood="nervous"
    self.class.all.push(self)
  end

  def self.all
    @@all
  end

  #ASSOCIATIONS



end
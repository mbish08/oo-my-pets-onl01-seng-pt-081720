require 'pry'

class Owner
  attr_accessor :owner, :mood 
  attr_writer 
  attr_reader :name, :species 
  
  @@all = []
  
  def initialize(name)
  @name = name  
  @species = "human"
  @@all << self 
  end 
  
  def say_species
    "I am a #{species}."
  end 
  
  def self.all 
    @@all 
  end 
  
  def self.count 
    @@all.count   
  end 
  
  def self.reset_all
    @@all.clear 
  end 
  
  def cats 
    Cat.all.select do |cat|
      cat.owner == self 
    end 
  end 
  
  def dogs 
    Dog.all.select { |dog| dog.owner == self }
  end 
  
  def buy_cat(cat)
    new_cat = Cat.new(cat, self) 
    new_cat.owner = self
  end 
  
  def buy_dog(dog)
    new_dog = Dog.new(dog, self)
    new_dog.owner = self
  end 
  
  def walk_dogs
    self.dogs.each do |dog|
      dog.mood = "happy"
    end 
  end 
  
  def feed_cats
    self.cats.each { |cat| cat.mood = "happy" }
  end 
  
  def sell_pets
    @pets = []
    self.dogs.each { |dog| dog.mood = "nervous" }
    self.cats.each { |cat| cat.mood = "nervous" }
    self.dogs.each { |dog| dog.owner = nil }
    self.cats.each { |cat| cat.owner = nil }
    Owner.reset_all
  end 
  
  def list_pets
    "I have #{@Owner.dogs.count} dog(s), and #{@owner.cats.count} cat(s)"
  end 
  
end
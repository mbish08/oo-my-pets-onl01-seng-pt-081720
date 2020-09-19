require 'pry'

class Owner
  attr_accessor :owner 
  attr_writer 
  attr_reader :name, :species 
  
  @@all = []
  
  def initialize(name)
  @name = name  
  @species = "human"
  @@all << self 
  end 
  
  def say_species
    "I am a human."
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
    cat.owner = self 
  end 
  
end
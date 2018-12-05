require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  #let are additional variables that aren't the focal point of the test
  #they are passed a block of code similar to subject.  But subject is a focal point of a test
  let(:chef) { double("chef") }   #this is a variable used to name a mock chef
  subject(:cookie) { Dessert.new("cookie", 5, chef)}
  # 
  # creating symbol cookie and setting equal to a new Object Dessert
  # cookie will always point to :cookie symbol
  describe "#initialize" do
    it "sets a type" do
      expect(cookie.type).to eq("cookie")
    end

    it "sets a quantity" do
      expect(cookie.quantity).to eq(5)
    end

    it "starts ingredients as an empty array" do
      expect(cookie.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("cookie", "five", "chef")}.to raise_error(ArgumentError) 
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      expect(cookie.add_ingredient("flour")).to eq(["flour"])
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ingredients = ["chocolate", "flour", "egg", "sugar"]

      ingredients.each do |ingredient|
        cookie.add_ingredient(ingredient)
      end

      cookie.mix!

      expect(cookie.ingredients).not_to eq(ingredients)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      cookie.eat(3)
      expect(cookie.quantity).to eq(2)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { cookie.eat(10) }.to raise_error("not enough left!")
    end
    
  end
  #look at solutions for last 2
  describe "#serve" do
    it "contains the titleized version of the chef's name" do 
      # to_receive means it will receive a method called titleize
      expect(chef).to receive(:titleize)
      cookie.serve
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      # to_receive means it will receive a method called bake(dessert)
      # methods can be symbolized when referred.  Rspec syntax
      # when we're calling method on an object we just have the name
      expect(chef).to receive(:bake).with(cookie)
      cookie.make_more
    end

  end
end

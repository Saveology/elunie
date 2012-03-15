require 'spec_helper'

describe Elunie::Move do

  include Elunie

  it "should accept size, color and shape in its constructor" do
    move = Move.new("big", "yellow", "lozenge")
    move.should be_instance_of(Move)
  end

  it "should return size, color and shape" do
    move = Move.new("big", "yellow", "lozenge")
    move.size.should eql "big"
    move.color.should eql "yellow"
    move.shape.should eql "lozenge"
  end
end
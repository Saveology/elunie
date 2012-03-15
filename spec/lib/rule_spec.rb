require 'spec_helper'

describe Elunie::Rule do

  include Elunie


  subject{
    Rule.new do |current_move, previous_move|
      if previous_move.shape == "lozenge"
        current_move.color == "blue"
      else
        previous_move.size == current_move.size
      end
    end
  }


  context "#initialize" do
    it "should take a block and store it" do
      lambda{
        rule = Rule.new do
          true
        end
      }.should_not raise_error

      lambda {
        rule = Rule.new
      }.should raise_error
    end
  end


  # big yellow lozenge
  # small blue circle
  # small yellow lozenge
  # if the last move is a lozenge, choose a blue one, if not 
  # choose one of the same size
  context "#valid?" do

    it "should return true if a move is valid" do

      # create two moves
      move1 = Move.new("big", "yellow", "lozenge")
      move2 = Move.new("small", "blue", "circle")

      subject.valid?(move2, move1).should be true
    end

    it "should return false if a move is not valid" do
      # create two moves
      move1 = Move.new("big", "yellow", "lozenge")
      move2 = Move.new("small", "yellow", "circle")

      subject.valid?(move2, move1).should be false
    end

  end


  context "#generate_moves" do
    it "should be able to generate moves" do
      moves = subject.generate_moves
      moves.length.should be 3
      moves.first.should be_instance_of(Move)
    end

    it "should generate valid moves" do

      moves = subject.generate_moves

      subject.valid?(moves[0], nil).should be true
      subject.valid?(moves[1], moves[0]).should be true
      subject.valid?(moves[2], moves[1]).should be true

    end

  end
end
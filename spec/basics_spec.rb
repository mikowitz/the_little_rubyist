require 'helper'

describe "Basics" do
  before do
    @list1 = %w{a b c}
    @list2 = [%w{a b c}, "x", "y", "z"]
    @atom = "hotdog"
    @short_list = ["hamburger"]
    @empty = []
    @nested_list1 = [[["hotdogs"]], ["and"], ["pickle"], "relish"]  
    @nested_list2 = [[["hotdogs"]], ["and"]]
  end
  describe "car" do
    it "should return an atom when the first element of a list is an atom" do
      (car @list1).should == "a"
    end
    it "should return a list when the first element of a list is a list" do
      (car @list2).should == ["a", "b", "c"]
    end
    it "should return nil when called on an atom" do
      (car @atom).should be_nil
    end
    it "should return nil when called on the empty list" do
      (car @empty).should be_nil
    end
    it "should return a nested list when the first element of a list is a nested list" do
      (car @nested_list1).should == [["hotdogs"]]
    end
    it "should chain calls correctly" do
      (car (car @nested_list2)).should == ["hotdogs"]
    end
  end
  describe "cdr" do
    it "should return all but the first element of a list when it is called on a list" do
      (cdr @list1).should == ["b", "c"]
      (cdr @list2).should == ["x", "y", "z"]
    end
    it "should return the empty list when called on a list with a single element" do
      (cdr @short_list).should == []
    end
    it "should return nil when called on an atom" do
      (cdr @atom).should be_nil
    end
    it "should return nil when called on the empty list" do
      (cdr @empty).should be_nil
    end
  end
  describe "combining car and cdr" do
    before do
      @list1 = [["b"], ["x", "y"], [["c"]]]
    end
    it "should return the correct value for (car (cdr l))" do
      (car (cdr @list1)).should == ["x", "y"]
    end
    it "should return the correct value for (cdr (cdr l))" do
      (cdr (cdr @list1)).should == [[["c"]]]
    end
  end
  describe "cons" do
    before do
      @atom1 = "peanut"
      @list1 = %w{ butter and jelly }
      @list2 = %w{ banana and }
      @list3 = %w{ peanut butter and jelly }
      @nested_list1 = [["help"], "this"]
      @nested_list2 = ["is", "very", [["hard"], "to", "learn"]]
      @nested_list3 = ["a", "b", ["c"]]
    end
    it "should concat an atom and a list" do
      (cons @atom1, @list1).should == %w{ peanut butter and jelly }
    end
    it "should concat two lists" do
      (cons @list2, @list3).should == [["banana", "and"], "peanut", "butter", "and", "jelly"]
    end
    it "should concat two nested lists" do
      (cons @nested_list1, @nested_list2).should == [[["help"], "this"], "is", "very", [["hard"], "to", "learn"]]
    end
    it "should concat a list to the empty list" do
      (cons @nested_list3, @empty).should == [["a", "b", ["c"]]]
    end
    it "should concat an atom to the empty list" do
      (cons @atom1, @empty).should == ["peanut"]
    end
    it "should return nil when the second argument is not a list" do
      (cons @list1, @atom1).should be_nil
    end
    it "should return nil when both arguments are atoms" do
      (cons @atom1, @atom1).should be_nil
    end
  end
  describe "null?" do
    it "should be true for the empty list" do
      (null? @empty).should be_true
    end
    it "should be false for a non-empty list" do
      (null? @list1).should be_false
    end
    it "should be nil for an atom" do
      (null? @atom).should be_nil
    end
  end
  describe "atom?" do
    it "should be true for an atom" do
      (atom? @atom).should be_true
    end
    it "should be false for a list" do
      (atom? @list1).should be_false
    end
  end
  describe "eq?" do
    before do
      @atom1 = "Harry"
      @atom2 = "Harry"
      @atom3 = "butter"
      @atom4 = "Mary"
      @list1 = %w{ Mary had a little lamb chop }
    end
    it "should be true when the two atoms are the same" do
      (eq? @atom1, @atom2).should be_true
    end
    it "should be false when the two atoms are different" do
      (eq? @atom2, @atom3).should be_false
    end
    it "should be nil when the first argument is not an atom" do
      (eq? @list1, @atom1).should be_nil
    end
    it "should be nil when the second arugment is not an atom" do
      (eq? @atom1, @list1).should be_nil
    end
    it "should chain calls to car" do
      (eq? (car @list1), @atom4).should be_true
    end
    it "should chain calls to cdr" do
      (eq? (cdr %w{soured milk}), "milk").should be_nil
    end
    it "should chain calls to both car and cdr" do
      l = %w{ beans beans we need jelly beans }
      (eq? (car l), (car (cdr l))).should be_true
    end
  end
end



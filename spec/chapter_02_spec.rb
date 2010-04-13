require 'helper'

describe "Chapter 02" do
  describe "lat?" do
    before do
      @list1 = %w{ Jack Sprat could eat no chicken fat }
      @nested_list1 = [["Jack"], "Sprat", "could", "eat", "no", "chicken", "fat"]
      @nested_list2 = ["Jack", ["Sprat", "could"], "eat", "no", "chicken", "fat"]
      @empty = []
    end
    it "should be true for a list" do
      (lat? @list1).should be_true
    end
    it "should be false when the first element of a list is a list" do
      (lat? @nested_list1).should be_false
    end
    it "should be false when any element of a list is a list" do
      (lat? @nested_list2).should be_false
    end
    it "should be true for the empty list" do
      (lat? @empty).should be_true
    end
  end
  describe "member?" do
    before do
      @atom = "tea"
      @list1 = %w{coffee tea or milk}
      @list2 = %w{fried eggs and scrambled eggs}
      @empty = []
    end
    it "should be true when the list contains the atom" do
      (member? @atom, @list1).should be_true
    end
    it "should be false when the list does not contain the atom" do
      (member? @atom, @list2).should be_false
    end
    it "should be false when passed the empty list" do
      (member? @atom, @empty).should be_false
    end
  end
end

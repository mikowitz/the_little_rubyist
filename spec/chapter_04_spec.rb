require 'helper'

describe "Chapter 4" do
  describe "add1" do
    it "should return 68 for 67" do
      (add1 67).should == 68
    end
  end
  describe "sub1" do
    it "should return 4 for 5" do
      (sub1 5).should == 4
    end
  end
  describe "zero?" do
    it "should be true for 0" do
      (zero? 0).should be_true
    end
    it "should be false for 1492" do
      (zero? 1492).should be_false
    end
  end
  describe "plus" do
    it "should add 2 numbers correctly" do
      (plus 46, 12).should == 58
    end
  end
  describe "minus" do
    it "should subtract the 2nd number from the first" do
      (minus 14, 3).should == 11
      (minus 17, 9).should == 8
    end
  end
  describe "addtup" do
    it "should return 18 for (3 5 2 8)" do
      (addtup [3,5,2,8]).should == 18
    end
    it "should return 43 for (15 6 7 12 3)" do
      (addtup [15,6,7,12,3]).should == 43
    end
  end
  describe "times" do
    it "should return 15 for 5 and 3" do
      (times 5, 3).should == 15
    end
    it "should return 52 for 13 and 4" do
      (times 13, 4).should == 52
    end
  end
end

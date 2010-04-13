require 'helper'

describe "Chapter 03" do
  describe "rember" do
    it "should remove the first instance of the atom from the list" do
      (rember "bacon", %w{bacon lettuce and tomato}).should == %w{lettuce and tomato}
    end
    it "should remove only the first instance of the atom from the list" do
      (rember "mint", %w{lamb chops and mint flavored mint jelly}).should ==
        %w{lamb chops and flavored mint jelly}
    end
    it "should return the original list if it does not contain the atom" do
      (rember "toast", %w{bacon lettuce and tomato}).should == %w{bacon lettuce and tomato}
    end
    it "should return the empty list if passed the empty list" do
      (rember "toast", []).should == []
    end
  end
  describe "firsts" do
    before do
      @list1 = %w{apple peach pumpkin}
      @list2 = %w{plum pear cherry}
      @list3 = %w{grape raisin pea}
      @list4 = %w{bean carrot eggplant}
    end
    it "should return the correct results for 4 lists" do
      l = [@list1, @list2, @list3, @list4]
      (firsts l).should == %w{apple plum grape bean}
    end
    it "should return the correct results for smaller lists" do
      (firsts [%w{a b}, %w{c d}, %w{e f}]).should == %w{a c e}
    end
    it "should return the correct results for the empty list" do
      (firsts []).should == []
    end
    it "should return the correct results for lists of different lengths" do
      l = [%w{five plums}, %w{four}, %w{eleven green oranges}]
      (firsts l).should == %w{five four eleven}
    end
    it "should return the correct results for nested lists" do
      l = [[%w{five plums}, "four"], %w{eleven green oranges}, [["no"], "more"]]
      (firsts l).should == [["five", "plums"], "eleven", ["no"]]
    end
  end
  describe "insertR" do
    it "should return the correct list for topping, fudge, and %w{ice cream with fudge for dessert}" do
      (insertR "topping", "fudge", %w{ice cream with fudge for dessert}).should == %w{ice cream with fudge topping for dessert}
    end
    it "should return the correct list for e, d, %w{a b c d f g d h}" do
      (insertR "e", "d", %w{a b c d f g d h}).should == %w{a b c d e f g d h}
    end
    it "should return the original list when 'old' is not contained in the list" do
      (insertR "y", "x", %w{a b c d e}).should == %w{a b c d e}
    end
  end
  describe "insertL" do
    it "should return the correct list for d, e, %w{a b c e f g e h}" do
      (insertL "d", "e", %w{a b c e f g e h}).should == %w{a b c d e f g e h}
    end
  end
  describe "subst" do
    it "should replace the first instance of old with new" do
      (subst "d", "e", %w{a b c e e f g e h}).should == %w{a b c d e f g e h}
    end
  end
  describe "subst2" do
    before do
      @list1 = %w{a b c e e f g}
      @list2 = %w{a b c x e f g}
    end
    it "should replace the first instance of old1 with new" do
      (subst2 "d", "e", "x", @list1).should == %w{a b c d e f g}
    end
    it "should replace the first instance of old2 with new" do
      (subst2 "d", "e", "x", @list2).should == %w{a b c d e f g}
    end
  end
  describe "multirember" do
    it "should remove the only instance of an element from the list" do
      (multirember "and", %w{green eggs and ham}).should == %w{green eggs ham}
    end
    it "should remove every instance of an element from the list" do
      (multirember "cup", %w{tea cup coffee cup hick cup}).should == %w{tea coffee hick}
    end
  end
  describe "multiinsertR" do
    it "should insert new to the right of all instances of old" do
      (multiinsertR "e", "d", %w{a b c d f g d h}).should == %w{a b c d e f g d e h}
    end
  end
  describe "multiinsertL" do
    it "should insert new to the left of all instances of old" do
      (multiinsertL "d", "e", %w{a b c e f g e h}).should == %w{a b c d e f g d e h}
    end
    it "should pass the example from the book" do
      (multiinsertL "fried", "fish", %w{chips and fish or fish and fried}).should == %w{chips and fried fish or fried fish and fried}
    end
  end
end



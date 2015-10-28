require 'spec_helper'

describe Enumerable do

	before (:each) do
		@array = Array.new([1,2,3])
		empty = []
	end

	it "checks my_map method" do
		expect(@array.my_map{|elt,i| elt * 3 }).to eq([3,6,9])
	end

	it "checks my_inject with initial argument method" do
		expect(@array.my_inject(8){|elt, i| elt * i}).to eq(48)
	end

	it "checks my_inject method" do
		expect(@array.my_inject{|elt, i| elt - i}).to eq(-4)
	end

	it "checks my_count method" do
		expect(@array.my_count{|elt| elt%2==1}).to eq(2)
	end

	it "checks my_select method" do
		expect(@array.my_select{|elt| elt * 2 == 6}).to eq([3])
	end

	it "checks my_select method with chars" do
		expect(["a","b","c","d"].my_select{|elt| elt > "b"}).to eq(["c", "d"])
	end

	it "checks my_all? method" do
		expect(@array.my_all?{|elt| elt % 2 == 0}).to eq(false)
	end

	it "checks my_none? method" do
		expect(@array.my_none?{|elt| elt > 5}).to eq(true)
	end
end
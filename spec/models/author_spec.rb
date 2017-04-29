require 'rails_helper'

describe Author do 
	it "is valid with a author" do
		author = Author.new(fName: "Margaret", lName: "Mitchell", biography: "a"*300, birthplace: "a"*20)
		expect(author).to be_valid
	end

	it "is invalid without a fName" do
		author = Author.new(fName: nil)
		author.valid?
		expect(author.errors[:fName]).to include("is too short (minimum is 2 characters)")
	end

	it "is invalid without a lName" do
		author = Author.new(lName: nil)
		author.valid?
		expect(author.errors[:lName]).to include("is too short (minimum is 2 characters)")
	end

	it "is invalid without a birthplace" do
		Author.create(birthplace: "a"*5)
		author = Author.new(birthplace: "a"*5)
		author.valid?
		expect(author.errors[:birthplace]).to include("is too short (minimum is 10 characters)")
	end

	it "is invalid without a biography" do
		Author.create(biography: "a"*10)
		author = Author.new(biography: "a"*10)
		author.valid?
		expect(author.errors[:biography]).to include("is too short (minimum is 200 characters)")
	end
end

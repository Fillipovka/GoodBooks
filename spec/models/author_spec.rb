require 'rails_helper'

describe Author do 
  it "is valid with a author" do
    expect(build(:author)).to be_valid
  end

  it "is invalid without a fName" do
    author = build(:author, fName: nil)
    author.valid?
    expect(author.errors[:fName]).to include("is too short (minimum is 2 characters)")
  end

  it "is invalid without a lName" do
    author = build(:author, lName: nil)
    author.valid?
    expect(author.errors[:lName]).to include("is too short (minimum is 2 characters)")
  end

  it "is invalid without a birthplace" do
    author = build(:author, birthplace: "a"*5)
    author.valid?
    expect(author.errors[:birthplace]).to include("is too short (minimum is 10 characters)")
  end

  it "is invalid without a biography" do
    author = build(:author, biography: "a"*5)
    author.valid?
    expect(author.errors[:biography]).to include("is too short (minimum is 200 characters)")
  end
end
  
require 'rails_helper'

RSpec.describe User, :type => :model do
  subject { described_class.new }

  it "is valid with valid attributes" do
    subject.uid = "Anything"
    subject.id = "Anything"
    subject.first_name = "Anything"
    subject.last_name = "Anything"
    subject.email = "Anything"
    subject.password = "Anything"
    expect(subject).to be_valid
  end

  it "is not valid without a uid" do
    expect(subject).to_not be_valid
  end

  it "is not valid without an id" do
    subject.uid = "Anything"
    expect(subject).to_not be_valid
  end

  it "is not valid without a first_name" do
    subject.uid = "Anything"
    subject.id = "Anything"
    expect(subject).to_not be_valid
  end

  it "is not valid without a last_name" do
    subject.uid = "Anything"
    subject.id = "Anything"
    subject.first_name = "Anything"
    expect(subject).to_not be_valid
  end
end
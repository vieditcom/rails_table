require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new(
      name: 'Any Name',
      email: 'test@example.com',
      phone: '+18018702135'
  ) }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without email" do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a phone" do
    subject.phone = nil
    expect(subject).to_not be_valid
  end

  it "is not valid with name shorter than 3 symbols" do
    subject.name = 'Ok'
    expect(subject).to_not be_valid
  end

  it "is not valid with name longer than 100 symbols" do
    subject.name = Faker::String.random(length: 101)
    expect(subject).to_not be_valid
  end

  it "is not valid with duplicated email" do
    subject.save!
    new_user = User.new(name: 'New Name', email: 'test@example.com', phone: '+18177750144')
    expect(new_user).to_not be_valid
  end

  it "is not valid with non-numeric phone" do
    subject.phone = 'phone'
    expect(subject).to_not be_valid
  end

end
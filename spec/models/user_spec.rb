require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new(
      name: 'AnyName',
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

  # it "is not valid with name shorter than 3 symbols" do
  #   subject.phone = nil
  #   expect(subject).to_not be_valid
  # end

  # it "is not valid with name longer than 100 symbols" do
  #   subject.phone = nil
  #   expect(subject).to_not be_valid
  # end

  # it "is not valid with duplicated email" do
  #   subject.phone = nil
  #   expect(subject).to_not be_valid
  # end



end
require 'rails_helper'

RSpec.describe User, type: :model do

  let(:valid_attributes) {
    { full_name: "Stan The Man",
      user_name: "Theman",
      password: "password",
      role: 0,
      email: "stan@stan.com" }
    }

  it "is valid" do
    user = User.new(valid_attributes)

    expect(user).to be_valid
  end

  it "is not valid without a full name" do
    user = User.new(full_name: nil,
                    user_name: "Theman",
                    password: "password",
                    role: 0,
                    email: "stan@stan.com")

    expect(user).not_to be_valid
  end

  it "is only valid if username is more than 2 characters" do
    user = User.new(full_name: "Stan The Man",
                    user_name: "T",
                    password: "password",
                    role: 0,
                    email: "stan@stan.com")

    expect(user).not_to be_valid
  end

  it "is only valid if username name is less than 32 characters" do
    user = User.new(full_name: "Stan The Man",
                    user_name: "Thisissuperlongbecuasewearetryingtoma",
                    password: "password",
                    role: 0,
                    email: "stan@stan.com")

    expect(user).not_to be_valid
  end

  it "is invalid without a password" do
    user = User.new(full_name: "Stan The Man",
                    user_name: "Theman",
                    password: nil,
                    role: 0,
                    email: "stan@stan.com")

    expect(user).not_to be_valid
  end

  it "defaults the role to 0" do
    user = User.new(full_name: "Stan The Man",
                    user_name: "Theman",
                    password: "password",
                    email: "stan@stan.com")

    expect(user.role).to eq('default')
  end

  it "the user can have a role of admin" do
    user = User.new(full_name: "Stan The Man",
      user_name: "Theman",
      password: "password",
      email: "stan@stan.com",
      role: 1)

    expect(user.role).to eq('admin')
  end

  it "is invalid without an email" do
    user = User.new(full_name: "Stan The Man",
                    user_name: "Theman",
                    password: "password",
                    role: 0,
                    email: nil)

    expect(user).not_to be_valid
  end

  it "is invalid unless email is unique" do
    User.create(valid_attributes)
    user = User.new(valid_attributes)

    expect(user).not_to be_valid
  end

  it "is invalid without a plausible email" do
    user = User.new(full_name: "Stan The Man",
                    user_name: "Theman",
                    password: "password",
                    role: 0,
                    email: "blah")

    expect(user).not_to be_valid
  end

  it "is valid even if the user doesn't enter a user_name" do
    user = User.new(full_name: "Rachel Warbelow",
      password: "password",
      email: "demo+rachel@jumpstartlab.com")

    expect(user).to be_valid
  end
end

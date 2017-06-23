require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_presence_of(:session_token) }
  it { should validate_length_of(:password).is_at_least(6) }

  subject(:user) { User.create!(email: "user@email.com", password: "password") }

  describe "password" do
    it "#password= should create a new password digest" do
      old_digest = user.password_digest
      user.password = "new_password"
      expect(user.password_digest).not_to eq(old_digest)
    end
    it "#is_password? should check if a password matches" do
      expect(user.is_password?("password")).to be(true)
      expect(user.is_password?("notpassword")).to be(false)
    end
  end

  describe "#reset_session_token" do
    it "should reset the users session token" do
      old_token = user.session_token
      user.reset_session_token!
      expect(user.session_token).not_to eq(old_token)
    end
  end

  describe "::find_by_credentials" do
    context "with invalid credentials" do
      it "should not find the user" do
        expect(User.find_by_credentials("user@email.com", "notpassword")).to be_nil
        expect(User.find_by_credentials("fake@email.com", "")).to be_nil
      end
    end
    context "with valid credentials" do
      it "should find the user" do
        expect(User.find_by_credentials("user@email.com", "password")).to eq(user)
      end
    end

    context "#all" do
      it "should have at least one user" do
        expect(User.all.length).not_to be(0)
      end
    end
  end
end

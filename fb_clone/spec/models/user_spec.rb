# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'User model validation' do
    let(:user) { FactoryBot.create(:user) }
    let(:user_with_nil_password) { FactoryBot.build(:user_with_nil_password) }
    let(:user_small_password_length) { FactoryBot.build(:user_small_password_length) }
    let(:user_with_blank_password) { FactoryBot.build(:user_with_blank_password) }
    let(:user1) { FactoryBot.create(:user, email: 'same_email@gmail.com') }
    it 'has a valid factory' do
      expect(user).to be_valid
    end

    it 'is invalid without a name' do
      user.name = nil
      expect(user).to_not be_valid
    end

    it 'is invalid without email' do
      user.email = nil
      expect(user).to_not be_valid
    end

    it 'is invalid without password' do
      expect(user_with_nil_password).to_not be_valid
    end
    it "it show error message includes 'can't be blank' for nil password " do
      user_with_nil_password.valid?
      expect(user_with_nil_password.errors[:password]).to include("can't be blank")
    end
    it 'is invalid with blank password attribute' do
      expect(user_with_blank_password).to_not be_valid
    end
    it "it show error message includes 'can't be blank' for blank password " do
      user_with_blank_password.valid?
      expect(user_with_blank_password.errors[:password]).to include("can't be blank")
    end

    it 'is invalid with password under six(6) characters of length' do
      expect(user_small_password_length).to_not be_valid
    end
    it "it show error message includes 'is too short (minimum is 6 characters)' password under six(6) characters of length " do
      user_small_password_length.valid?
      expect(user_small_password_length.errors[:password]).to include('is too short (minimum is 6 characters)')
    end
    it 'is invalid with a duplicate email address' do
      # user takes user1 email.
      user.email = 'same_email@gmail.com'
      user1.valid?
      user.valid?
      expect(user.errors[:email]).to include('has already been taken')
    end
  end

  context 'User associations' do
    describe 'User model associations' do
      it 'has many posts' do
        assc = User.reflect_on_association(:posts)
        expect(assc.macro).to eq :has_many
      end
    end
  end
end

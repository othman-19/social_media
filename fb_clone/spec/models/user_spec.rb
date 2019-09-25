require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'User model validation' do
    let(:user) { FactoryBot.create(:user)}
    
    it 'has a valid factory' do
      expect(user).to be_valid
    end

    it "is invalid without a name" do
      user.name = nil
      expect(user).to_not be_valid
    end

    it "is invalid without email" do
      user.email = nil
      expect(user).to_not be_valid
    end

    it "is invalid without password" do
      subject { FactoryBot.create(:user_with_nil_password)}
      expect(subject).to_not be_valid
    end
    it "it show error message includes 'can't be blank' for nil password " do
      subject { FactoryBot.create(:user_with_nil_password)}
      subject.valid?
      expect(subject.errors[:password]).to include("can't be blank")
    end
    it "is invalid with blank password attribute" do
      subject { FactoryBot.create(:user_with_blank_password) }
      expect(subject).to_not be_valid
    end
    it "it show error message includes 'can't be blank' for blank password " do
      subject { FactoryBot.create(:user_with_blank_password) }
      subject.valid?
      expect(subject.errors[:password]).to include("can't be blank")
    end

    it "is invalid with password under six(6) characters of length" do
      subject { FactoryBot.create(:user_small_password_length) }
      expect(subject).to_not be_valid
    end
    it "it show error message includes 'is too short (minimum is 6 characters)' password under six(6) characters of length " do
      subject { FactoryBot.create(:user_small_password_length) }
      subject.valid?
      expect(subject.errors[:password]).to include("is too short (minimum is 6 characters)")
    end
    it "is invalid with a duplicate email address" do
       User.create(
        name:  "Othmane",
        email:      "tester@example.com",
        password:   "dottle-nouveau-pavilion-tights-furze"
       )
       user = User.new(
        name:  "Emese",
        email:      "tester@example.com",
        password:   "dottle-nouveau-pavilion-tights-furze"
        )
        user.valid?
        expect(user.errors[:email]).to include("has already been taken")
      end
    #it "returns a contact's full name as a string"
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

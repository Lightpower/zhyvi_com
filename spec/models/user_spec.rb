require 'spec_helper'

describe User do

  describe 'validators' do
    it 'failed with empty username and email' do
      user = FactoryGirl.build(:user, username: nil, email: nil)
      user.should_not be_valid
      user.errors.full_messages.should =~ ['Укажите логин или email.']
    end

    it 'failed with invalid username' do
      user = FactoryGirl.build(:user, username: '<<<')
      user.should_not be_valid
      user.errors.full_messages.should =~ ['Username может состоять только из букв латиницы, цифр и символов "- _ . @".']
    end

    it 'failed with invalid email' do
      user = FactoryGirl.build(:user, email: 'wrong_email')
      user.should_not be_valid
      user.errors.full_messages.should =~ ['Email не соответствует формату.']
    end
  end
end

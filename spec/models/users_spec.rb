require 'spec_helper'

describe User do 

  before do
    @user = FactoryGirl.build(:user)
  end

  it 'Gets UID assigned' do
    @user.save!
    expect(@user.uid).not_to be_blank
  end

  it 'gets first_name assigned' do
    @user.save!
    expect(@user.first_name).not_to be_blank
  end

  it "doesnt send a confirmzton email" do
    expect(@user.save!).not_to change(ActionMailer::Base::deliveries.count)
  end

end
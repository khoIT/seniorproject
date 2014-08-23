require 'rails_helper'

RSpec.describe User, :type => :model do
  before(:each) do
    @user = FactoryGirl.create(:user)
    @ride1 = FactoryGirl.create(:ride)
    @ride2 = FactoryGirl.create(:ride)
    @ride3 = FactoryGirl.create(:ride)
  end

  it 'must have a name' do
    expect(@user.attributes).to include("name")
  end
  it 'must have a email' do
    expect(@user.attributes).to include("email")
  end

  it 'should have a fare' do
    @user.fares << [@ride1, @ride2]
    expect(@user.fares.count).to eq(2)
  end

  it 'should know if user is in rides' do
    @user.rides << @ride1
    @user.fares << @ride2
    expect(@user.passenger?(@ride1)).to be true
    expect(@user.driver?(@ride2)).to be true
  end

  it 'should be able to hop in rides' do
    @user.rides << @ride1
    @user.jump_off!(@ride1)
    expect(@user.passenger?(@ride1)).to be false
    @user.hop_in!(@ride1)
    expect(@user.passenger?(@ride1)).to be true
  end
end

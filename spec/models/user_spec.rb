require 'rails_helper'

RSpec.describe User, :type => :model do
  before(:each) do
    @user = FactoryGirl.create(:user)
    @ride1 = FactoryGirl.create(:ride)
    @ride2 = FactoryGirl.create(:ride)
    @ride3 = FactoryGirl.create(:ride)
    @ride4 = FactoryGirl.create(:ride)
    @user.hop_in!(@ride1)
    @ride1.passenger_rides.find_by_passenger_id(@user.id).update_attributes(confirmed: "true")
    @ride1.seats_left -= 1
    @user.hop_in!(@ride2)
    @ride2.passenger_rides.find_by_passenger_id(@user.id).update_attributes(confirmed: "true")
    @ride2.seats_left -= 1
    @user.hop_in!(@ride2)
    @user.fares << @ride3
  end

  it 'must have a name' do
    expect(@user.attributes).to include("name")
  end
  it 'must have a email' do
    expect(@user.attributes).to include("email")
  end

  it 'should have a driver' do
    expect(@user.driver?(@ride3)).to be true
  end

  it 'should know if user is in rides' do
    expect(@user.passenger?(@ride1)).to be true
  end

  it 'should be able to hop in rides' do
    @user.hop_in!(@ride4)
    expect(@ride4.passengers).to include(@user)
  end

  it 'should be able to jump off rides' do
    @user.jump_off!(@ride1)
    expect(@ride1.seats_left).to eq(3)
    expect(@user.passenger?(@ride1)).to be false
  end
end

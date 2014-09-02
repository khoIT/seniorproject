require 'rails_helper'

RSpec.describe Ride, :type => :model do
  before(:each) do
    @ride = FactoryGirl.create(:ride)
    @passenger1 = FactoryGirl.create(:user, name: "Jake", email:"jake@depauw.edu")
    @passenger2 = FactoryGirl.create(:user, name: "Selena", email:"selena@depauw.edu")
    @passenger3 = FactoryGirl.create(:user, name: "Anna", email:"anan@depauw.edu")
    @driver = FactoryGirl.create(:user)
  end

  it 'should have some passengers' do
    @ride.passengers << [@passenger1, @passenger2, @passenger3]
    expect(@ride.passengers.count).to eq(3)
  end

  it 'should have pending passengers' do
    @passenger1.hop_on!(@ride)
    @passenger2.hop_on!(@ride)
    expect(@ride.pending_passengers.count).to eq(2)
  end

  it 'should be able to accept users' do
    @passenger1.hop_on!(@ride)
    @passenger2.hop_on!(@ride)
    @ride.accept(@passenger1)
    expect(@ride.passengers.count).to eq(2)
  end

  it 'should match other rides' do
    #if ride has same start anad destination and less than 12 hours then matches ? returns true
    @existing_ride = FactoryGirl.create(:ride, time: Time.now.beginning_of_hour())
    expect(@ride.matches).to include(@existing_ride)
  end
end

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
end

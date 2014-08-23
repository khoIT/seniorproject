require 'rails_helper'

RSpec.describe User, :type => :model do
  before(:each) do
    @user = FactoryGirl.create(:user)
    @ride1 = FactoryGirl.create(:ride)
    @ride2 = FactoryGirl.create(:ride)
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
end

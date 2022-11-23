require 'rails_helper'

RSpec.describe Spending, type: :model do
  before :each do
    @user = User.new(name: 'Test', email: 'test@test.com', password: 123_456, password_confirmation: 123_456)
    @user.save
    @group = Group.new(name: 'Group', icon: 'icon link', user_id: @user.id)
    @group.save
    @spending = Spending.new(name: 'Spending', amount: '20', user_id: @user.id, group_id: @group.id)
  end

  it 'is valid' do
    expect(@spending).to be_valid
  end

  it 'name should be present' do
    @spending.name = nil
    expect(@spending).to_not be_valid
  end

  it 'amount should be present' do
    @spending.amount = nil
    expect(@spending).to_not be_valid
  end
end

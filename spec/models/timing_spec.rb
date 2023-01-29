require 'rails_helper'

RSpec.describe Timing, type: :model do
  it 'is valid with valid attributes' do
    test_timing = Timing.create(meal: 'Dinner', date:'2020-03-17')
    expect(test_timing).to be_valid
  end
end

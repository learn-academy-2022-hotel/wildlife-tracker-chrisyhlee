require 'rails_helper'

RSpec.describe Food, type: :model do
  it 'is valid with valid attributes' do
    muffin = Food.create(name:'Muffin', calories:400, protein:10)
    expect(muffin).to be_valid
  end
  it 'is not valid without a name' do
    muffin = Food.create(calories:400, protein:10)
    expect(muffin.errors[:name]).to_not be_empty
  end
  it 'is not valid without a calorie amount' do
    muffin = Food.create(name:'Muffin', protein:10)
    expect(muffin.errors[:calories]).to_not be_empty
  end
  it 'is not valid without a protein amount' do
    muffin = Food.create(name:'Muffin', calories:400)
    expect(muffin.errors[:protein]).to_not be_empty
  end
  it 'is not valid if calories match protein' do
    muffin = Food.create(name:'Muffin', calories:400, protein:400)
    expect(muffin.errors[:protein]).to_not be_empty
  end
  it 'is not valid if name is not unique' do
    muffin = Food.create(name:'Muffin', calories:400, protein:20)
    bagel = Food.create(name:'Muffin', calories:400, protein:10)
    expect(bagel.errors[:name]).to_not be_empty
  end
  it 'will return a 422 error if validations run into errors' do
    muffin = Food.create(name:'Muffin', calories:100)
    muffin.save
    expect(muffin.errors[:protein]).to_not be_empty
  end
end

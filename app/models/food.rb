class Food < ApplicationRecord
    has_many :timings
    validates :name, :calories, :protein, presence: true
    validates :name, uniqueness: true
    validate :attribute_validation
    def attribute_validation
        if calories == protein
            errors.add(:calories, 'calories cannot equal protein')
            errors.add(:protein, 'protein cannot equal calories')
        end
    end
end

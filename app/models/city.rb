class City < ApplicationRecord
    has_many :employees
    validates :name, presence: true
    validates_uniqueness_of :name
end

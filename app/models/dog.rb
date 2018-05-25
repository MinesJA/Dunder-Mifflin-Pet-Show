class Dog < ApplicationRecord
  has_many :employees, dependent: :destroy
end

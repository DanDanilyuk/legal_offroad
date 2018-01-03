class Form < ApplicationRecord
  validates :name_first_last, presence: true
  validates :address_street, presence: true
  validates :address_city, presence: true
  validates :address_state, presence: true
  validates :address_zip, presence: true
  validates :phone, presence: true
  validates :email, presence: true
  validates :vin, presence: true
  validates :make, presence: true
  validates :model, presence: true
  validates :year, presence: true
  validates :cc, presence: true
  validates :color, presence: true
  validates :purchase_date, presence: true
end

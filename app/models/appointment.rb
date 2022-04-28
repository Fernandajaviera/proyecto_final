class Appointment < ApplicationRecord
  belongs_to :pets
  belongs_to :users
end

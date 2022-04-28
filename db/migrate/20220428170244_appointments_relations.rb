class AppointmentsRelations < ActiveRecord::Migration[5.2]
  def change
    add_reference :appointments, :user, index: true
    add_reference :appointments, :pet, index: true
  end
end

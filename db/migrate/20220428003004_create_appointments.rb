class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.timestamp :date
      t.string :description
      t.boolean :is_active, default: true

      t.timestamps
    end
  end
end

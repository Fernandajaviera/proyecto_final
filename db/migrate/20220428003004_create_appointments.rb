class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.timestamp :date
      t.string :description, default: ""
      t.boolean :is_active, default: false

      t.timestamps
    end
  end
end

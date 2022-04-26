class PetsUsersRelation < ActiveRecord::Migration[5.2]
  def change
    add_reference :pets, :user, index: true
  end
end

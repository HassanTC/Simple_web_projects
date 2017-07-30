class CreateOsystems < ActiveRecord::Migration
  def change
    create_table :osystems do |t|
      t.string :name
      t.string :install_code

      t.timestamps null: false
    end
  end
end

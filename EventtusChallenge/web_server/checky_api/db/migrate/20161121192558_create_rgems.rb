class CreateRgems < ActiveRecord::Migration
  def change
    create_table :rgems do |t|
      t.string :name
      t.float  :version, default: nil

      t.timestamps null: false
    end
    add_index :rgems, :name
  end
end

class CreateSystemlibs < ActiveRecord::Migration
  def change
    create_table :systemlibs do |t|
      t.string :name

      t.timestamps null: false
    end
    add_index :systemlibs, :name
  end
end

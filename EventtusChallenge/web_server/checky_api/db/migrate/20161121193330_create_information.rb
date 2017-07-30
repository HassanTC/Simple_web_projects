class CreateInformation < ActiveRecord::Migration
  def change
    create_table :information do |t|
      t.references :osystem,   index: true
      t.references :systemlib, index: true
      t.references :rgem,      index: true

      t.timestamps null: false
    end
    add_foreign_key :informations, :osystems
    add_foreign_key :informations, :systemlibs
    add_foreign_key :informations, :rgems
  end
end

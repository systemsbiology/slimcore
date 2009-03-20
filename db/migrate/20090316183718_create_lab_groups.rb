class CreateLabGroups < ActiveRecord::Migration
  def self.up
    create_table :lab_groups do |t|
      t.string :name
      t.integer :lock_version

      t.timestamps
    end
  end

  def self.down
    drop_table :lab_groups
  end
end

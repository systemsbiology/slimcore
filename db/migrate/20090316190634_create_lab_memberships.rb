class CreateLabMemberships < ActiveRecord::Migration
  def self.up
    create_table :lab_memberships do |t|
      t.integer "user_id"
      t.integer "lab_group_id"
      t.integer "lock_version"

      t.timestamps
    end
  end

  def self.down
    drop_table :lab_memberships
  end
end

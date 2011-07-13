class AddEncryptedPasswordToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :encrypted_password, :string
    add_column :users, :encryption_salt, :string
  end

  def self.down
    remove_column :users, :encryption_salt
    remove_column :users, :encrypted_password
  end
end

class Release2 < ActiveRecord::Migration
  def self.up
    
    create_table :accounts do |t|
      t.string :name, :null => false
      t.timestamps
    end
    
    create_table :users do |t|
      t.belongs_to :account, :null => false
      t.string :email, :null => false
      t.string :salt, :crypted_password, :token, :null => false
      t.string :time_zone
    end    
    add_index :users, :account_id
    add_index :users, :email, :unique => true
    
  end

  def self.down
  end
end

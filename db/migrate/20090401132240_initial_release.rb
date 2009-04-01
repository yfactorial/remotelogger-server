class InitialRelease < ActiveRecord::Migration
  
  def self.up
    
    create_table :applications do |t|
      t.belongs_to :account
      t.string :name, :token, :null => false
      t.timestamps
    end
    add_index :applications, :token
    add_index :applications, :account_id
    
    create_table :statements do |t|
      t.belongs_to :application, :null => false
      t.string :device_id, :level, :null => false
      t.text :message, :null => false
      t.timestamp :logged_at
      t.timestamps
    end    
    add_index :statements, :application_id
    add_index :statements, :level
    add_index :statements, [:logged_at, :created_at]
  end

  def self.down
  end
end

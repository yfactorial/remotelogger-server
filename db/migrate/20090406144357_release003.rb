class Release003 < ActiveRecord::Migration
  
  def self.up
    
    create_table :device_labels do |t|
      t.belongs_to :account, :null => false
      t.string :label, :device_id, :null => false
    end
    
    add_index :device_labels, [:account_id, :device_id], :unique => true
    add_index :device_labels, [:account_id, :label], :unique => true
    
    # Missed index from before
    add_index :statements, :device_id
  end

  def self.down
  end
end

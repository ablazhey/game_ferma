class CreateBanks < ActiveRecord::Migration
  def change
    create_table :banks, :id => false do |t|
        t.float :volume_milk, :default => 0
        t.float :many,  :default => 0
    end
  end
end

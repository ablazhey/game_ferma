class CreateKine < ActiveRecord::Migration
  def change
    create_table :kine do |t|
      t.string :name, :default => "NoName"
      t.integer :age, :default => 1
      t.float :milk,  :default => 0
    end
  end
end

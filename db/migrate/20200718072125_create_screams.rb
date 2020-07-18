class CreateScreams < ActiveRecord::Migration[5.1]
  def change
    create_table :screams do |t|
      t.integer :score, default: 0
      t.references :user,foreign_key:true,nil:false
      t.references :bar,foreign_key:true,nil:false

      t.timestamps
    end
  end
end

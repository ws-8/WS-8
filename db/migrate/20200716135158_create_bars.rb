class CreateBars < ActiveRecord::Migration[5.1]
  def change
    create_table :bars do |t|
      t.integer :page, null: false
      t.integer :score, null: false
      t.references :lesson,foreign_key:true,nil:false

      t.timestamps
    end
  end
end

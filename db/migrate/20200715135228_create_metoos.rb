class CreateMetoos < ActiveRecord::Migration[5.1]
  def change
    create_table :metoos do |t|
      t.references :question,foreign_key:true,nil:false
      t.references :user,foreign_key:true,nil:false

      t.timestamps
    end
  end
end

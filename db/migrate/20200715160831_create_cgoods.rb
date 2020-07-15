class CreateCgoods < ActiveRecord::Migration[5.1]
  def change
    create_table :cgoods do |t|
      t.references :comment,foreign_key:true,nil:false
      t.references :user,foreign_key:true,nil:false

      t.timestamps
    end
  end
end

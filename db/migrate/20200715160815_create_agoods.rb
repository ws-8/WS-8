class CreateAgoods < ActiveRecord::Migration[5.1]
  def change
    create_table :agoods do |t|
      t.references :answer,foreign_key:true,nil:false
      t.references :user,foreign_key:true,nil:false

      t.timestamps
    end
  end
end

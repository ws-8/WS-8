class AddSolvedToQuestion < ActiveRecord::Migration[5.1]
  def change
    add_column :questions, :solved, :boolean, default:false,null:false
  end
end

# frozen_string_literal: true

class AddPageToQuestion < ActiveRecord::Migration[5.1]
  def change
    add_column :questions, :page, :integer
  end
end

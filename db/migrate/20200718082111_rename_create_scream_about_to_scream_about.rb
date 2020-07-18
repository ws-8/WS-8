class RenameCreateScreamAboutToScreamAbout < ActiveRecord::Migration[5.1]
  def change
    rename_table :create_scream_abouts, :scream_abouts
  end
end

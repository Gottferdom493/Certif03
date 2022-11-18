class AddNomcolonneToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :sujet, :text
  end
end

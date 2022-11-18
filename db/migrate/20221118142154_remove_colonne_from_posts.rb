class RemoveColonneFromPosts < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :sujer, :text
  end
end

class CreateWikisAndCollaborators < ActiveRecord::Migration
  def change
    create_table :wikis_and_collaborators do |t|
      
      t.integer :user_id
      t.integer :wiki_id

      t.timestamps

    end
  end
end
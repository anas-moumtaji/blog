class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    drop_table :articles
    create_table :articles do |t|
      t.string :title
      t.text :description
      t.references :utilisateur, null: false, foreign_key: true

      t.timestamps
    end
  end
end

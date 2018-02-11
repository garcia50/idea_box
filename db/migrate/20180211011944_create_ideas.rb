class CreateIdeas < ActiveRecord::Migration[5.1]
  def change
    create_table :ideas do |t|
      t.text :content
      t.references :user, foreign_key: true
      t.references :categories, foreign_key: true
    end
  end
end

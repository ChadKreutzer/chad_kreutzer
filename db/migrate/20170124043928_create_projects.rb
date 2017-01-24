class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :image_link
      t.string :url
      t.string :description
    end
  end
end

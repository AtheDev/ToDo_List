class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :title
      t.boolean :status, default: false
      t.datetime :deadline
      t.belongs_to :category, index: true
      t.string :image
      t.timestamps
    end
  end
end

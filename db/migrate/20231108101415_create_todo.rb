class CreateTodo < ActiveRecord::Migration[7.1]
  def change
    create_table :todos do |t|
      t.string :title, index: true
      t.string :description
      t.datetime :due_date, index: true
      t.string :status
      t.references :user
      t.timestamps
    end
  end
end

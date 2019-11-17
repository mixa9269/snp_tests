class CreateTests < ActiveRecord::Migration[5.2]
  def change
    create_table :app_tests do |t|
      t.string :title
      t.string :scope_key

      t.timestamps
    end
  end
end

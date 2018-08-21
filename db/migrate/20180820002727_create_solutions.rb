class CreateSolutions < ActiveRecord::Migration[5.1]
  def change
    create_table :solutions do |t|
      t.text :values
      t.belongs_to :mad_lib, foreign_key: true

      t.timestamps
    end
  end
end

class CreateMadLibs < ActiveRecord::Migration[5.1]
  def change
    create_table :mad_libs do |t|

      t.timestamps
    end
  end
end

class CreateWeathers < ActiveRecord::Migration
  def change
    create_table :weathers do |t|

      t.timestamps
    end
  end
end

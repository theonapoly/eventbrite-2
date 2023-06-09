class CreateAttendances < ActiveRecord::Migration[7.0]
  def change
    create_table :attendances do |t|
      t.string :stripe_customer_id
      t.references :user, index: true
      t.references :event, index: true

      t.timestamps
    end
  end
end

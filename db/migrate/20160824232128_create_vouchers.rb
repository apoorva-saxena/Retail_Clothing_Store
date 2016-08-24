class CreateVouchers < ActiveRecord::Migration[5.0]
  def change
    create_table :vouchers do |t|
      t.string :name
      t.decimal :discount_amount
      t.decimal :spend_requirement
      t.string :category_requirements

      t.timestamps
    end
  end
end

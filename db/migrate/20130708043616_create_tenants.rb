class CreateTenants < ActiveRecord::Migration
  def change
    create_table :tenants do |t|
      #basic information
      t.string :company_name, :null=>false

      #subscription information
      t.string :edition,:null=>false
      t.string :subscription_reference
      t.string :expire_at,:null=>false
      t.integer :subscription_status,:null=>false

      #payer information
      t.string :customer_first_name
      t.string :customer_last_name
      t.string :customer_email
      t.string :customer_phone


      t.timestamps
    end
  end
end

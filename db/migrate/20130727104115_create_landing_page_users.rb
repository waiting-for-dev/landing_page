class CreateLandingPageUsers < ActiveRecord::Migration
  def change
    create_table :landing_page_users do |t|
      t.string :email

      t.timestamps
    end
    add_index :landing_page_users, :email, unique: true
  end
end

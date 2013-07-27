class AddNameToLandingPageUsers < ActiveRecord::Migration
  def change
    add_column :landing_page_users, :name, :string
  end
end

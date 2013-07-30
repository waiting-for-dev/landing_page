class AddLocaleToLandingPageUsers < ActiveRecord::Migration
  def change
    add_column :landing_page_users, :locale, :string
  end
end

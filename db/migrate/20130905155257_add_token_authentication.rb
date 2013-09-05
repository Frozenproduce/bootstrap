class AddTokenAuthentication < ActiveRecord::Migration
  def up
    change_table :users do |t|
      t.string :authentication_token
    end
  end

  def down
    change_table :users do |t|
      t.remove :authentication_token
    end
  end
end

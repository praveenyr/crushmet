class AddUserRefToRegisteredApplications < ActiveRecord::Migration[5.1]
  def change
    add_reference :registered_applications, :user, foreign_key: true
  end
end

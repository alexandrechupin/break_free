class AddDetailsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :gender, :string
    add_column :users, :age, :date
    add_column :users, :ethnic_origin, :string
    add_column :users, :sexual_orientation, :string
    add_column :users, :education, :string
    add_column :users, :job_status, :string
    add_column :users, :marital_status, :string
  end
end

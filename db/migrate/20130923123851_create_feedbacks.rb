class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :message

      t.timestamps
    end
  end
end

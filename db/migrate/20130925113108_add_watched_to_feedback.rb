class AddWatchedToFeedback < ActiveRecord::Migration
  def change
    add_column :feedbacks, :watched, :boolean, default: false
  end
end

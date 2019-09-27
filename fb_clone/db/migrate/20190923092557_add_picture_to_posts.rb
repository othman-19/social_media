# frozen_string_literal: true

class AddPictureToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :picture, :string
  end
end

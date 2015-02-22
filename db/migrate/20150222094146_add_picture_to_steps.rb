class AddPictureToSteps < ActiveRecord::Migration
  def self.up
    add_attachment :steps, :picture
  end

  def self.down
    remove_attachment :steps, :picture
  end
end

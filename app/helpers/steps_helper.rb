module StepsHelper
  def display_picture(step)
    unless step.picture_file_name.nil?
      image_tag step.picture.url(:medium), class: "stepPicture"
    end
  end
end

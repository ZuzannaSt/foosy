class PlayerDecorator < ApplicationDecorator
  delegate_all
  decorates_association :matches

  def full_name
    h.link_to "#{model.first_name} #{model.last_name}", model
  end

  def small_avatar
    h.image_tag model.avatar.url(:thumb), class: "img-circle"
  end

  def medium_avatar
    h.image_tag model.avatar.url(:medium), class: "img-circle"
  end

  # def current_or_new_avatar
  #   if model.avatar.exists?
  #     h.content_tag(:label, "Current avatar")
  #     h.content_tag small_avatar
  #   end
  # end

  def winner
    "WINNER"
  end

  def looser
    "looser"
  end

end

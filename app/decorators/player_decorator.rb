class PlayerDecorator < ApplicationDecorator
  delegate_all
  decorates_association :matches

  def full_name
    "#{model.first_name} #{model.last_name}"
  end

  def link_to_full_name
    h.link_to "#{model.first_name} #{model.last_name}", model
  end

  def mini_avatar
    h.image_tag model.avatar.url(:mini), class: "img-circle"
  end

  def small_avatar
    h.image_tag model.avatar.url(:thumb), class: "img-circle"
  end

  def medium_avatar
    h.image_tag model.avatar.url(:medium), class: "img-circle"
  end

  def winner
    "WINNER"
  end

  def looser
    "looser"
  end

end

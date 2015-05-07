class MatchDecorator < ApplicationDecorator
  delegate_all
  decorates_association :players

  def long_date
    h.link_to model.date.to_formatted_s(:long), model
  end
end

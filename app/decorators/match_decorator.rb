class MatchDecorator < Draper::Decorator
  delegate_all
  delegate :current_page, :per_page, :offset, :total_entries, :total_pages

  decorates_association :players

  def long_date
    h.link_to model.date.to_formatted_s(:long), model
  end
end

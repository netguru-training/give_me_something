class AppStatsDecorator < Draper::Decorator

  def users_count
    User.count
  end

  def gifts_count
    Gift.count
  end

  def lists_count
    List.count
  end

  def bought_gifts_count
    Gift.where.not(buyer_id: nil).count
  end

end
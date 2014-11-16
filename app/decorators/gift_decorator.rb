class GiftDecorator < Draper::Decorator
  delegate_all

  def css_available_class
    if buyer_id.present?
      return "success"
    else
      return "warning"
    end
  end
  
end

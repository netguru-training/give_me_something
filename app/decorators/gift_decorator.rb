class GiftDecorator < Draper::Decorator
  delegate_all

  def css_available_class
    if buyer_id.present?
      return "success"
    else
      return "warning"
    end
  end

  def search_site_url(search_engine)
    SearchSiteUrlGenerator.new(search_engine, object.name).to_s
  end

  def available_search_site
    [:allegro, :ebay, :amazon, :google]
  end

  def bought?
    buyer_id.present?
  end

  def short_description
    if description.present?   
      if description.size < 50
        description
      else
        "#{description.truncate(49)}"
      end
    else
      ""
    end
  end
  
end

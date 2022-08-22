module ApplicationHelper
  include Pagy::Frontend

  def flash_alert_class(key)
    case key
    when 'notice'
      'success'
    when 'alert', 'error'
      'danger'
    else
      key
    end
  end

  def article_cover_url(article)
    return 'https://via.placeholder.com/600x200?text=welcome%20to%20Finnology' if article.cover.blob.blank?

    url_for(article&.cover)
  end

  def public_article_link(article)
    article_path(slug: article.slug)
  end
end

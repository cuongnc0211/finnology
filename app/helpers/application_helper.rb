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
    return 'https://via.placeholder.com/600x200?text=welcome%20to%20Finnology' if article.nil? || article.cover.blob.blank?

    return article.cover.attachment.url if Rails.env.production?

    url_for(article.cover)
  end

  def public_article_link(article)
    slug = article&.slug || 'sample'
    article_url(slug: slug)
  end
end

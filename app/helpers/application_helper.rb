module ApplicationHelper

  def markdown(text)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, {autolink: true, lax_spacing: true})
    markdown.render(text).html_safe
  end
end

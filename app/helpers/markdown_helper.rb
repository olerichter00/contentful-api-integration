module MarkdownHelper
  def parse_markdown(markdown_string)
    renderer = Redcarpet::Render::HTML
    markdown = Redcarpet::Markdown.new(renderer)

    markdown.render(markdown_string).html_safe
  end
end

require 'rouge/plugins/redcarpet'

class HTML < Redcarpet::Render::HTML
  include Rouge::Plugins::Redcarpet
end

module MarkdownHelper
  def markdown(text)
    options = {
      filter_html: true,
      hard_wrap: true
    }
    extensions = {
      no_intra_emphasis: true,
      tables: true,
      fenced_code_blocks: true,
      autolink: true,
      quote: true,
      space_after_headers: true,
      with_toc_data: true,
      xhtml: true,
      lax_html_blocks: true,
      strikethrough: true,
      tables: true,
      no_intra_emphasis: true
    }

    unless @markdown
      renderer = HTML.new(options)
      @markdown = Redcarpet::Markdown.new(renderer, extensions)
    end

    @markdown.render(text).html_safe
  end
end


module WebsiteHelper
  def rouge(language, code = nil, &block)
    formatter = Rouge::Formatters::HTML.new(css_class: 'highlight')
    lexer = Rouge::Lexer.find(language)
    code ||= yield
    formatter.format(lexer.lex(code)).html_safe
  end
end

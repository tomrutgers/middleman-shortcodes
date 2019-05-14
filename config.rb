set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'


$shortcode = Shortcode.new

$shortcode.setup do |config|
  config.template_path = 'source/shortcodes'
  config.block_tags = [:quote, :youtube]
end

helpers do
  def markdown(content)
    markdown = Tilt['markdown'].new { content }.render
    $shortcode.process(markdown)
  end
end

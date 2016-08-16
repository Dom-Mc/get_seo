#CLI Controller
class GetSeo::CLI

  def run
    get_seo_data
    welcome_message
    seo_options
    goodbye_message
  end

  def get_seo_data
    # url = "https://flatironschool.com" # TODO: Remove later
    seo_info = GetSeo::Seo.setup#(url)
  end

  def seo_options
    puts "\nTo inspect a page's SEO information, please enter that page's domain (i.e. example.com):"
  end

  def welcome_message
    puts "Welcome to SEO. Ok enough chitchat, let's get to work!"
  end

  def goodbye_message
    puts "Great SEO work! Job well done."
  end

end

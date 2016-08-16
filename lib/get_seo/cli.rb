#CLI Controller
class GetSeo::CLI

  def run
    get_seo_data
    welcome_message
    goodbye_message
  end

  def get_seo_data
    # url = "https://flatironschool.com" # TODO: Remove later
    seo_info = GetSeo::Seo.setup#(url)
  end

  def welcome_message
    puts "Welcome to SEO. Ok enough chitchat, let's get to work!"
  end

  def goodbye_message
    puts "Great SEO work! Job well done."
  end

end

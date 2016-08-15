#CLI Controller
class GetSeo::CLI

  def run
    get_seo_data
  end

  def get_seo_data
    # url = "https://flatironschool.com" # TODO: Remove later
    seo_info = GetSeo::Seo.setup#(url)
  end

end

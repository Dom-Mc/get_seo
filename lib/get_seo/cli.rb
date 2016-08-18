#CLI Controller
class GetSeo::CLI

  attr_accessor :protocal, :start_of_program, :seo_data

  def initialize
    @start_of_program = true
  end

  def run_program
    welcome_message
    check_requested_protocal
    get_seo_info
    seo_menu if start_of_program
    goodbye_message
  end

  private

    def check_requested_protocal
      loop do
        line_break
        puts "Check the webpage you would like to inspect and find out if it uses 'http' or 'https'?",
        "-To select 'http' (Enter 1)",
        "-To select 'https' (Enter 2)"

        requested_protocal = gets.strip.downcase

        if requested_protocal == '1' || requested_protocal == 'http'
          self.protocal = 'http://'
          break
        elsif requested_protocal == '2' || requested_protocal == 'https'
          self.protocal = 'https://'
          break
        else
          section_break
          puts "\t*Sorry but '#{requested_protocal}' is not a valid option.*"
          section_break
        end
      end
    end

    def get_seo_info
      line_break
      puts "In order to retrieve SEO information, please enter the domain of the webpage you would like to inspect (i.e. example.com):"

      print protocal # 'http://' or 'https://'
      requested_url = gets.strip.downcase

      # NOTE: Throw an exception if website cannote be accessed
      begin

        self.seo_data = GetSeo::Seo.setup(protocal + requested_url)

      rescue

        section_break
        puts "\t*There seems to be an issue with the domain you entered.*",
        "\t*Please double check the url and try again.*"
        section_break

        run_program
      end
    end

    def seo_menu
      # NOTE: pervent seo_menu from running again after "exit"
      self.start_of_program = false

      loop do

        2.times { line_break }
        puts "What information would you like to retrieve?:",
        "- Title Tag (Enter 1)",
        "- Description Meta Tag' (Enter 2)",
        "- Keyword Meta Tag (Enter 3)",
        "- h1 Heading Tag(s) (Enter 4)",
        "- h2 Heading Tag(s) (Enter 5)",
        "- h3 Heading Tag(s) (Enter 6)",
        "- Image Alt Attribute(s)' (Enter 7)",
        "- Exit the program (Enter 'exit' or 'quit')"

        user_selection = gets.strip.downcase

        case user_selection
        when '1'
          print_seo_data(seo_data.title, "Title Tag")
        when '2'
          print_seo_data(seo_data.description, "Description Meta Tag")
        when '3'
          print_seo_data(seo_data.keywords, "Keywords Meta Tag")
        when '4'
          print_seo_data(seo_data.heading1, "h1 Heading Tag(s)")
        when '5'
          print_seo_data(seo_data.heading2, "h2 Heading Tag(s)")
        when '6'
          print_seo_data(seo_data.heading3, "h3 Heading Tag(s)")
        when '7'
          print_seo_data(seo_data.img_alt_attribute, "Image Alt Attribute(s)")
        when 'exit', 'quit'
          break
        else
          section_break
          puts "\t*Sorry but '#{user_selection}' is invalid, please select another option.*"
          section_break
        end
      end

    end

    def welcome_message
      line_break
      puts "Welcome to SEO. Ok enough chitchat, let's get to work!"
    end

    def goodbye_message
      line_break
      puts "Great SEO work! Job well done."
      line_break
    end

    def print_seo_data(data_attr, name)
      section_break
      puts "\t*#{name.upcase}*"
      section_break

      if data_attr.empty?
        puts "\t*#{name} - Not found on page.*"
      else
        data_attr.each do |value|
          puts "* #{value}"
        end
      end
    end

    def section_break
      line_break
      70.times { print '*' }
      line_break
    end

    def line_break
      puts "\n"
    end

end

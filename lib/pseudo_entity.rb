#PseudoEntityRandoms.use_top_100_nouns = false
#PseudoEntityRandoms.use_top_100_adjectives = false
#PseudoEntityRandoms.use_top_last_names = false
#PseudoEntityRandoms.external_cache_directory = nil#File.join(this_dir, 'cache')

class PseudoEntity

  require 'pseudo_entity/randoms'

  include Enumerable
  include Randoms

  def initialize(options={})
    parse_options options
  end

  def address
    "#{street_address}\n#{city}, #{state}. #{zip_code}"
  end

  def age
    Date.today.year - birth_day.year
  end

  def apartment?
    street_modifier_needed == :apartment
  end

  def birth_year
    birth_day.year
  end

  def credit_card_last_four
    credit_card_number[-4..-1]
  end
  alias :credit_card_last4 :credit_card_last_four

  def full_name
    "#{first_name} #{last_name}"
  end

  def google_map_url
    "https://maps.google.com/maps?q=loc:#{latitude},#{longitude}"
  end

  # Reset all internal values causing them to be regenerated.
  def reset!
    self.instance_variables.each { |variable| instance_variable_set(variable, nil) }
    self
  end

  def street_address
    # Yes it is in 2-1 order because that's how the US Post Office says to do it.
    # Apartment, Suites, etc go on the first line if there are two lines or at the end of the single line
    # http://pe.usps.com/businessmail101/addressing/deliveryaddress.htm
    "#{street_address_line_2} #{street_address_line_1}".strip
  end

  def street_address_line_1
    if apartment?
      "APT #{apartment_number}"
    elsif suite?
      "STE #{suite_number}"
    else
      street_position
    end
  end

  def street_address_line_2
    street_address_line_1 # Force the determination of line 1 as this effects line 2
    street_modifier_needed? ? street_position : nil
  end

  def suite?
    street_modifier_needed == :suite
  end

  def yelp_business_id
    # Yelp API version 2.0 id
    "#{company_name.gsub(' ', '-').delete('.')}-#{city.gsub(' ', '-').delete('.')}"
  end

  def yelp_business_url
    "http://www.yelp.com/biz/#{yelp_business_id}"
  end

  def yelp_user_id
    random_alpha_numeric(22)
  end

  def to_s
    add = address.sub("\n","\n         ")
    [
        "Name: #{full_name}",
        "Age: #{age}",
        "Sex: #{sex}",
        "Email: #{email_address}",
        "IP Address: #{ip_address}",
        "Website: #{website}",
        "Short Url: #{short_url}",
        "Phone: #{phone_number}",
        "Address: #{add}",
        "Coordinates: #{latitude}, #{longitude}",
        "Timezone: #{time_zone}",
        "Bank: #{bank_name} #{bank_routing_number} #{bank_account_number}",
        "Credit Union: #{credit_union_name}",
        "Card: #{credit_card_issuer} #{credit_card_number}",
        "Company: #{company_name}",
        "Slogan: #{slogan}",
        "Tax ID: #{federal_tax_id}",
        "Login: #{login}",
        "Password: #{password}"
    ].join("\n")
  end
=begin

  def method_missing(name, *args, &block)

    aritied = [/^numeric_\d+$/, /^alpha_\d+$/, /^alpha_numeric_\d+$/, /^token_\d+$/]
    n = name.to_s

    if aritied.any? { |x| x =~ n }

      if /^numeric_\d+$/ === n || /^alpha_\d+$/ === n || /^alpha_numeric_\d+$/ === n
      # Define numeric_X, alpha_numeric_x, and alpha_X helpers on the fly
      size = /.*_(\d+)$/.match(n)[1].to_i
      core_name = ("random_" + /(.*)_\d+$/.match(n)[1]).to_sym

      self.class.send(:define_method, name) do
        iv = instance_variable_get("@#{name}".to_sym)
        if iv.nil?
          iv = send(core_name, size)
          instance_variable_set("@#{name}".to_sym, iv)
        end
        iv
      end
      self.send(name)
    elsif /^token_\d+$/ === n
      # Define token_X helpers on the fly
      size = /.*_(\d+)$/.match(n)[1].to_i
      self.class.send(:define_method, name) do
        iv = instance_variable_get("@#{name}".to_sym)
        if iv.nil?
          iv = send(:random_token, size)
          instance_variable_set("@#{name}".to_sym, iv)
        end
        iv
      end
      self.send(name)
    elsif /^rand_\d+$/ === n
      # Define rand_X helpers on the fly
      max = /.*_(\d+)$/.match(n)[1].to_i
      self.class.send(:define_method, name) do
        iv = instance_variable_get("@#{name}".to_sym)
        if iv.nil?
          iv = rand(max)
          instance_variable_set("@#{name}".to_sym, iv)
        end
        iv
      end
      self.send(name)
    else
      super
    end
  end
=end

  #def respond_to?(method, *args)
  #  m = method.to_s
  #  # This is starting to get ridiculous. Time to refactor.
  #  /^numeric_\d+$/ === m || /^alpha_numeric_\d+$/ === m || /^alpha_\d+$/ === m || /^token_\d+$/ === m || /^rand_\d+$/ === m || super
  #end if RUBY_VERSION < "1.9"
  #
  #def respond_to_missing?(method, *args)
  #  m = method.to_s
  #  # This is starting to get ridiculous. Time to refactor.
  #  /^numeric_\d+$/ === m || /^alpha_numeric_\d+$/ === m || /^alpha_\d+$/ === m || /^token_\d+$/ === m || /^rand_\d+$/ === m || super
  #end if RUBY_VERSION >= "1.9"

  def self.all
    @all = Randoms.names.map { |name| new :first_name => name.first, :last_name => name.last }
  end

  def self.each(&block)
    all.each(&block)
  end

  def self.to_a
    all
  end

  def self.load_caches(verbose=false)
    entity = new
    RandomValues.each do |method|
      puts method if verbose
      begin
        entity.send(method)
      rescue  => e
        puts e.message
      end
    end
    true
  end

end

require 'pseudo_entity/version'
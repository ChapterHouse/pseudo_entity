begin
  require 'active_support/all'
rescue LoadError
  require 'active_support'
end

require 'uuidtools'
require 'huge_enumerable'

module PseudoEntity::Randoms

  require 'pseudo_entity/randoms/constants'
  require 'pseudo_entity/randoms/location'

  # These are the randoms values available and are neither composites nor subsets of anything else in this list.
  RandomValues = [:apartment_number,    :bank_routing_number, :bank_account_number, :bank_name,           :birth_day,
                  :city,                :company_name,        :country_code,        :credit_card_issuer,  :credit_card_number,
                  :credit_union_name,   :domain,              :email_address,       :federal_tax_id,      :first_name,
                  :ip_address,          :last_name,           :latitude,            :login,               :longitude,
                  :password,            :phone_number,        :property_number,     :sex,                 :time_shift,
                  :short_url,           :slogan,              :state,               :street_name,         :suite_number,
                  :website,             :uuid,                :time_zone,
                  :zip_code,            :facebook_id,         :review,              :salt,
                  :iv,                  :google_analytics_account_id,               :region,              :subject,
                  :noun,                :adjective
  ]

  ArityValues = [/^numeric_\d+$/, /^alpha_\d+$/, /^alpha_numeric_\d+$/, /^token_\d+$/, /^rand_\d+$/]
  ArityRandoms = [/^random_numeric_\d+$/, /^random_alpha_\d+$/, /^random_alpha_numeric_\d+$/, /^random_token_\d+$/]


  include Constants

  # Create the lazy loading accessors
  RandomValues.each do |value_name|
    class_eval %{
      def #{value_name}
        @#{value_name} ||= random_#{value_name}
      end
    }
  end

  # Im still not happy about this but at least it is out of PseudoEntity.
  def shift_time(options={:distance => :days, :direction => :either, :base => nil, :min => nil, :max => nil})
    random_time_shift options
  end

  def method_missing(name, *args, &block)

    if arity_random?(name)
      # Define random_X helpers on the fly
      size = /.*_(\d+)$/.match(name)[1].to_i
      base_name = (/(.*)_\d+$/.match(name.to_s)[1]).to_sym
      self.class.send(:define_method, name) do
        self.send(base_name, size)
      end
      self.class.send(:private, name)
      send(name)
    elsif arity_value?(name)
      iv_name = "@#{name}".to_sym
      command = "random_#{name}".to_sym
      relay = arity_random?(command)
      if !relay
        size = /.*_(\d+)$/.match(name)[1].to_i
        command = (/(.*)_\d+$/.match(name.to_s)[1]).to_sym
        object = Kernel
      end
      self.class.send(:define_method, name) do
        iv = instance_variable_get(iv_name)
        if iv.nil?
          iv = relay ? send(command) : object.send(command, size)
          instance_variable_set(iv_name, iv)
        end
        iv
      end
      send(name)
    else
      super
    end
  end

  def respond_to?(method, include_all=false)
    include_all && arity_random?(method) || arity_value?(method) || super
  end if RUBY_VERSION < "1.9"

  def respond_to_missing?(method, include_all=false)
   include_all && arity_random?(method) || arity_value?(method) || super
  end if RUBY_VERSION >= "1.9"

  private

  def parse_options(options={})
    # Make an instance variable for each randoms value and set it to anything sent in for it via the options.
    RandomValues.each { |value_name| instance_variable_set("@#{value_name}".to_sym,options[value_name]) }
  end

  def arity_random?(name)
    name = name.to_s
    ArityRandoms.any? { |x| x =~ name }
  end

  def arity_value?(name)
    name = name.to_s
    ArityValues.any? { |x| x =~ name }
  end

  def random_adjective
    PseudoEntity::Randoms.adjectives.pop
  end

  def random_alpha(size)
    chars = ('a'..'z').to_a + ('A'..'Z').to_a
    (1..size).map { chars[rand(chars.size)] }.join
  end

  def random_alpha_numeric(size)
    chars = ('a'..'z').to_a + ('A'..'Z').to_a + (0..9).to_a
    (1..size).map { chars[rand(chars.size)] }.join
  end

  def random_apartment_number
    rand(998) + 1
  end

  def random_bank_account_number
    random_numeric(13)
  end

  def random_bank_name
    PseudoEntity::Randoms.bank_names.pop
  end

  def random_bank_routing_number
    random_numeric(9)
  end

  def random_birth_day
    # Everyone will be between 21 and 101 years old.
    Date.today - 21.years - rand(80 * 365).days
  end

  def random_city
    PseudoEntity::Randoms.cities.pop
  end

  def random_class_a_ip_address
    #10.0.0.0 - 10.255.255.255       16777216
    "10.#{rand(255)}.#{rand(255)}.#{rand(255)}"
  end

  def random_class_b_ip_address
    #172.16.0.0 - 172.31.255.255     1048576
    "172.#{rand(15) + 16}.#{rand(255)}.#{rand(255)}"
  end

  def random_class_c_ip_address
    #192.168.0.0 - 192.168.255.255   65536
    "192.168.#{rand(255)}.#{rand(255)}"
  end

  def random_company_name
    PseudoEntity::Randoms.company_names.pop
  end

  def random_country_code
    location.country_code
  end

  def random_credit_card
    PseudoEntity::Randoms.credit_cards.pop
  end

  def random_credit_card_issuer
    credit_card.first
  end

  def random_credit_card_number
    credit_card.last
  end

  def random_credit_union_name
    PseudoEntity::Randoms.credit_union_names.pop
  end

  def random_domain
    PseudoEntity::Randoms.domains.pop
  end

  def random_email_address
    "#{first_name}.#{last_name}@#{domain}"
  end

  def random_facebook_id
    "%.20i" % rand(2**64)
  end

  def random_federal_tax_id
    random_numeric(9)
  end

  def random_first_name
    PseudoEntity::Randoms.first_names.pop
  end

  def random_google_analytics_account_id
    "UA-#{random_numeric(7)}-#{random_numeric(2)}"
  end

  def random_ip_address
    class_a_size = 16777216
    class_b_size = 1048576
    class_c_size = 65536

    subnet = rand(class_a_size + class_b_size + class_c_size)
    if subnet < class_a_size
      random_class_a_ip_address
    elsif subnet < class_a_size + class_b_size
      random_class_b_ip_address
    else
      random_class_c_ip_address
    end

  end

  def random_iv
    OpenSSL::Cipher::Cipher.new('aes-256-cbc').random_iv
  end

  def random_last_name
    PseudoEntity::Randoms.last_names.pop
  end

  def random_latitude
    location.latitude
  end

  def random_login
    "#{last_name.downcase}_#{first_name.downcase}"
  end

  def random_longitude
    location.longitude
  end

  def random_noun
    PseudoEntity::Randoms.nouns.pop
  end

  def random_password
    # Bet they will never guess this one! :P
    "#{first_name.downcase}_#{last_name.downcase}"
  end

  def random_phone_number
    "#{location.area_code}-#{random_numeric(3)}-#{random_numeric(4)}"
  end

  def random_property_number
    rand(9989) + 10
  end

  def random_region
    PseudoEntity::Randoms.regions.pop
  end

  def random_review
    PseudoEntity::Randoms.reviews.pop
  end

  def random_salt
    Time.now.to_i.to_s
  end

  def random_sex
    PseudoEntity::Randoms.sex_of(first_name) || ['Female', 'Male'].sample
  end

  def random_short_url
    "http://ti.ny/#{domain.hash}"
  end

  def random_slogan
    PseudoEntity::Randoms.slogans.pop
  end

  def random_state
    location.state
  end

  def random_street_modifier_needed
    # One out of ten addresses gets something.
    if rand(10) == 0
      # 70% of the time it is a suite.
      if rand(10) < 7
        :suite
      else
        :apartment
      end
    else
      # The rest of the time we do not need to generate one.
      false
    end
  end

  def random_street_name
    PseudoEntity::Randoms.street_names.pop
  end

  def random_numeric(size)
    "%.#{size}i" % rand(10**size)
  end

  def random_subject
    PseudoEntity::Randoms.subjects.pop
  end

  def random_suite_number
    rand(498) + 1
  end

  def random_time_between(min, max)
    PseudoEntity::Randoms.time_between min, max
  end

  def random_time_shift(options={:distance => :days, :direction => :either, :base => nil, :min => nil, :max => nil})
    distance = options[:distance] || :days
    direction = options[:direction] || :either
    base = options[:base]
    min = options[:min]
    max = options[:max]

    shift = PseudoEntity::Randoms.time_shift distance, direction

    if base
      conversion = case base
                   when DateTime
                     :to_datetime
                   when Date
                     :to_date
                   when Time
                     :to_time
                   else
                     nil
                   end

      new_time = base.to_datetime + shift
      if max && new_time > max.to_datetime
        new_time = max
      elsif min && new_time < min.to_datetime
        new_time = min
      end
      conversion ? new_time.send(conversion) : new_time
    else
      shift
    end

  end

  def random_time_zone
    location.time_zone
  end

  def random_token(size)
    PseudoEntity::Randoms.token(size)
  end

  def random_token_8
    PseudoEntity::Randoms.token_8
  end

  def random_token_16
    PseudoEntity::Randoms.token_16
  end

  def random_token_32
    PseudoEntity::Randoms.token_32
  end

  def random_token_64
    PseudoEntity::Randoms.token_64
  end

  def random_uuid
    PseudoEntity::Randoms.uuid
  end

  def random_website
    "http://#{domain}"
  end

  def random_zip_code
    location.zip_code
  end


  ##### Helpers for above #####

  def credit_card
    @credit_card ||= random_credit_card
  end

  def determine_street_modifier_needed
    # If a property number has already been set then we assume that any required apartment or suite number has also been set.
    if @property_number
      if @apartment_number
        :apartment
      elsif @suite_number
        :suite
      else
        false
      end
    else
      random_street_modifier_needed
    end
  end

  def location
    @location ||= PseudoEntity::Randoms.locations.pop
  end

  def street_modifier_needed
    @street_modifier_needed ||= determine_street_modifier_needed
  end
  alias street_modifier_needed? street_modifier_needed

  def street_position
    "#{property_number} #{street_name}"
  end



  # This method allows us to build data sets that will refresh automatically when they are blanked.
  # The initial set of data comes from the supplied block. That block will only be run once and the results will be cached.
  # Each time the data set is blanked, it will be reloaded from cache and shuffled (if the data set supports the operation).
  # By removing the values out of the data set, instead of using sample, you are guaranteed to not have repeats until the data set is refreshed and shuffled again.
  def self.data_for(name, &block)
    # Grab the data set
    data = data_get(name)
    # If it is out of data or has never been initialized in the first place
    if data.blank?
      # Grab the internal cache of all the generated data
      original_data = original_data_get(name)
      # If it also has never been initialized
      if original_data.nil?
        # Call the block and get the full set of data
        original_data = yield
        # Store the data so we never have to call that block again
        original_data_set(name, original_data)
      end
      # Reset the data set that will be given to callers. They can do whatever with it. If the data set is cleared it will just be refreshed from cache.
      data = data_set(name, original_data.respond_to?(:shuffle) ? original_data.shuffle : original_data.dup)
    end
    # Give them what they asked for
    data
  end

  # Now generate the infinite arrays/enumerables.
  def self.adjectives
    data_for_adjectives_is { HugeCollection.new(ADJECTIVES) }
  end

  def self.subjects
    data_for_subjects_is { RandomSubjects.new(ADJECTIVES, NOUNS) }
  end

  def self.bank_names
    data_for_bank_names_is { RandomBankNames.new(BANK_PREFIXES) }
  end

  def self.cities
    data_for_cities_is { HugeCollection.new(CITIES) }
  end

  def self.company_names
    data_for_company_names_is { RandomCompanyNames.new(ADJECTIVES, NOUNS, COMPANY_TYPES) }
  end

  def self.company_types
    data_for_company_types_is { HugeCollection.new(COMPANY_TYPES) }
  end

  def self.credit_cards
    data_for_credit_cards_is { HugeCollection.new(CREDIT_CARDS) }
  end

  def self.credit_union_names
    data_for_bank_names_is { RandomCreditUnionNames.new(CREDIT_UNION_PREFIXES) }
  end

  def self.domains
    data_for_domains_is { RandomDomains.new(NOUNS, DOMAINS) }
  end

  def self.female_first_names
    data_for_female_first_names_is { HugeCollection.new(FEMALE_FIRST_NAMES) }
  end

  def self.first_names
    data_for_first_names_is { HugeCollection.new(FEMALE_FIRST_NAMES + MALE_FIRST_NAMES) }
  end

  def self.last_names
    data_for_last_names_is { HugeCollection.new(SURNAMES) }
  end

  def self.locations
    data_for_locations_is { RandomLocations.new(LOCATIONS_HASH) }
  end

  def self.female_names
    data_for_female_names_is { HugeProduct.new(FEMALE_FIRST_NAMES, SURNAMES) }
  end

  def self.female_full_names
    data_for_female_full_names_is { RandomNames.new(FEMALE_FIRST_NAMES, SURNAMES) }
  end

  def self.full_names
    data_for_full_names_is { RandomNames.new(FEMALE_FIRST_NAMES + MALE_FIRST_NAMES, SURNAMES) }
  end

  def self.male_names
    data_for_male_names_is { HugeProduct.new(MALE_FIRST_NAMES, SURNAMES) }
  end

  def self.male_first_names
    data_for_male_first_names_is { HugeCollection.new(MALE_FIRST_NAMES) }
  end

  def self.male_full_names
    data_for_male_full_names_is { RandomNames.new(MALE_FIRST_NAMES, SURNAMES) }
  end

  def self.names
    data_for_names_is { HugeProduct.new(FEMALE_FIRST_NAMES + MALE_FIRST_NAMES, SURNAMES) }
  end

  def self.nouns
    data_for_nouns_is { HugeCollection.new(NOUNS) }
  end

  def self.time_between(min, max)
    conversion = case min
                 when DateTime
                   :to_datetime
                 when Date
                   :to_date
                 when Time
                   :to_time
                 else
                   nil
                 end
    min = min.to_datetime
    max = max.to_datetime
    new_time = min + (max - min) * rand
    new_time = new_time.send(conversion) if conversion
    new_time
  end


  def self.regions
    data_for_regions_is { HugeCollection.new(REGIONS) }
  end


  def self.reviews
    data_for_reviews_is { RandomReviews.new(review_patterns, ADJECTIVES, NOUNS) }
  end

  def self.review_patterns
    data_for_review_patterns_is { HugeCollection.new(REVIEW_PATTERNS) }
  end


  def self.sex_of(first_name)
    if FEMALE_FIRST_NAMES.include?(first_name)
      'Female'
    elsif MALE_FIRST_NAMES.include?(first_name)
      'Male'
    else
      nil
    end
  end

  def self.slogans
    data_for_slogans_is { RandomSlogans.new(SLOGAN_PATTERNS, ADJECTIVES, NOUNS) }
  end

  def self.slogan_patterns
    data_for_slogan_patterns_is { HugeCollection.new(SLOGAN_PATTERNS) }
  end

  def self.street_names
    data_for_street_names_is { RandomStreetNames.new(STREET_POSITIONS, STREET_NAMES) }
  end

  def self.time_shift(distance = :days, direction = nil)
    shift =
      case distance
      when :centuries
        1000.years
      when :decades
        100.years
      when :years
        10.years
      when :months
        12.months
      when :days
        30.days
      when :hours
        24.hours
      when :minutes
        60.minutes
      when :seconds
        60.seconds
      else
        distance
      end.to_f * rand

    direction = direction.to_s if direction
    shift *= -1 if direction.starts_with?('backward') || (!direction || direction == 'either') && rand(2) == 1
    shift
  end

  def self.token(size)
    (1..(size + 31) / 32).map { UUIDTools::UUID.random_create.hexdigest }.join('')[0..size-1]
  end

  def self.uuid
    UUIDTools::UUID.random_create.to_s
  end

  def self.zip_code_state_hash
    data_for_zip_code_state_hash_is do
      with_fresh_locations do
        locations.inject({}) do |hsh, location|
          hsh[location.zip_code] = location.state
          hsh
        end
      end
    end
  end

  def self.zip_code_states
    data_for_zip_code_states_is { zip_code_state_hash.to_a }
  end

  # Convert the string, name, into a symbol representing the instance variable. :@name
  def self.data_iv_sym(name)
    "@#{name.to_s}".to_sym
  end

  # Using the string, name, return the value from the instance variable, @name
  def self.data_get(name)
    instance_variable_get(data_iv_sym(name))
  end

  def self.data_set(name, array)
    instance_variable_set(data_iv_sym(name), array)
  end

  # Convert the string, name, into a symbol representing the cached instance variable. :@original_name
  def self.original_data_iv_sym(name)
    "@original_#{name.to_s}".to_sym
  end

  # Using the string, name, return the value from the instance variable, @original_name
  def self.original_data_get(name)
    instance_variable_get(original_data_iv_sym(name))
  end

  def self.original_data_set(name, array)
    instance_variable_set(original_data_iv_sym(name), array)
  end


  # Clear out one of the data sets being used, returning back what was in it.
  def self.clear_data(name)
    remaining_data = data_get(name)
    data_set(name, nil)
    remaining_data
  end


  # Save what is currently in the cached array, reload the cache, run a block, and then restore the cached array with what was originally there.
  def self.with_fresh(name, *other_names, &block)
    old_values = clear_data(name)
    next_name = other_names.shift
    results = next_name ? with_fresh(next_name, *other_names, &block) : yield
    data_set(name, old_values)
    results
  end

  def self.preload
    %w{
      adjectives
      subjects
      bank_names
      cities
      company_names
      company_types
      credit_cards
      credit_union_names
      domains
      female_first_names
      first_names
      last_names
      locations
      female_names
      female_full_names
      full_names
      male_names
      male_first_names
      male_full_names
      names
      nouns
      regions
      slogans
      slogan_patterns
      street_names
      zip_code_state_hash
      zip_code_states
    }.each do |name|
      puts "Preloading #{name}"
      puts "#{self.send(name).size} #{name} loaded."
    end
    puts "Done"
  end


  def self.method_missing(name, *args, &block)
    name_s = name.to_s
    if name_s[0..10] == "with_fresh_"
      with_fresh(name_s[11..-1], &block)
    elsif name_s[0..8] == "data_for_" && name_s[-3..-1] == "_is"
      data_for(name_s[9..-4], &block)
    else super
    super
    end
  end



  class RandomBankNames < HugeCombination
    # BANK_PREFIXES.combination(2).map { |x| (x << "Bank").join(' ') }}

    def initialize(bank_prefixes)
      super(bank_prefixes, 2)
    end

    def fetch(x)
      (super(x) << "Bank").join(' ')
    end

  end

  class RandomCompanyNames < HugeProduct
   #adjectives.product(nouns).product(company_types).map { |x| x.flatten.join(' ') }

   def initialize(adjectives, nouns, company_types)
     adjective_nouns = HugeProduct.new(adjectives.map(&:titleize), nouns.map(&:titleize))
     super(adjective_nouns, company_types.map(&:titleize))
   end

   def fetch(x)
     super(x).flatten.join(' ')
   end

  end

  class RandomCreditUnionNames < HugeCombination
    # CREDIT_UNION_PREFIXES.combination(2).map { |x| (x << "Credit Union").join(' ') }

    def initialize(credit_union_prefixes)
      super(credit_union_prefixes, 2)
    end

    def fetch(x)
      (super(x) << "Credit Union").join(' ')
    end

  end

  class RandomDomains < HugeProduct
    #nouns.permutation(2).map(&:to_s).product(DOMAINS).map { |x| x.join('.') }

    def initialize(nouns, top_level_domains)
      @nouns = HugePermutation.new(nouns, 2)
      super(@nouns, top_level_domains)
    end

    def fetch(x)
      product = super(x)
      nouns = product.first
      "#{nouns.join}.#{product.last}"
    end

  end

  class RandomNames < HugeProduct

    def initialize(first_names, last_names)
      super(first_names, last_names)
    end

    def fetch(x)
      super(x).join(' ')
    end

  end

  class RandomLocations < HugeCollection

    def initialize(locations)
      super(locations.dup)
    end

    def fetch(x)
      location = super(x)
      if location.is_a?(Hash)
        location = Location.new(location)
        enum[x] = location
      end
      location
    end

  end

  class RandomReviews < HugeProduct
    #review_patterns.product(adjectives.product(nouns).permutation(2))

    def initialize(review_patterns, adjectives, nouns)
      subjects = HugeProduct.new(adjectives, nouns)
      combined_subjects = HugePermutation.new(subjects, 2)
      super(review_patterns, combined_subjects)
    end

    def fetch(x)
      review = super(x)
      review.first % review.last.flatten
    end

  end

  class RandomSlogans < HugeProduct
    #slogan_patterns.product(adjectives).product(nouns).map { |x| x[0][0] % [x[0][1], x[1]] }
    def initialize(slogan_patterns, adjectives, nouns)
      subjects = HugeProduct.new(adjectives, nouns)
      super(slogan_patterns, subjects)
    end

    def fetch(x)
      slogan = super(x)
      slogan.first % slogan.last
    end

  end

  class RandomStreetNames < HugeProduct

    def initialize(street_positions, street_names)
      super(street_positions, street_names)
    end

    def fetch(x)
      street = super(x)
      # Slightly increase the likelihood of a repetition by preventing silly names like "SE Main Street North"
      if ["North", "South", "East", "West"].any? { |x| street.last.include?(x) }
        street.last
      else
        street.join(' ')
      end
    end

  end

  class RandomSubjects < HugeProduct
    #adjectives.product(nouns).map { |x| x.join(' ') }
    def initialize(adjectives, nouns)
      super(adjectives, nouns)
    end

    def fetch(x)
      super(x).join(' ')
    end

  end

end


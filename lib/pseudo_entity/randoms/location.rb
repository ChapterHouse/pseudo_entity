require 'csv'
require 'yaml'

# A four space mapping of valid area codes, zip codes, states, and counties.
class PseudoEntity::Randoms::Location

  attr_reader :zip_code, :state, :area_code, :county, :country_code, :latitude, :longitude, :time_zone

  def initialize(zip_code, state, area_code, county, country_code, latitude, longitude, time_zone=nil)
    @zip_code = "%.5i" % zip_code.to_i
    @state = state.to_s
    @area_code = area_code.to_s
    @county = county.to_s
    @county = @county[0..-8] if @county.downcase[-7..-1] == " county"
    @latitude = latitude.to_f
    @longitude = longitude.to_f
    @country_code = country_code
    @time_zone = ActiveSupport::TimeZone.all.find { |x| x.tzinfo == ActiveSupport::TimeZone.find_tzinfo(time_zone)} || idealized_time_zone
  end

  def to_s
    [
        "zip code: #{zip_code}",
        "state: #{state}",
        "area code: #{area_code}",
        "county: #{county}",
        "country: #{country_code}",
        "latitude: #{latitude}",
        "longitude: #{longitude}",
        "time zone: #{time_zone}"
    ].join("\n")
  end


  def self.from_csv(csv_file=File.expand_path(File.join(File.dirname(__FILE__), 'zip_code_database.csv')))
    #puts "Loading locations from #{csv_file}"

    # Filters
    standard_zip_codes = Proc.new { |row| row[1] == 'STANDARD' }
    typical_states = Proc.new { |row| PseudoEntity::STATES.include?(row[5]) }
    commissioned = Proc.new { |row| row[13] == '0' }
    with_area_codes = Proc.new { |row| row[8] }
    with_counties = Proc.new { |row| row[6] }
    with_time_zones = Proc.new { |row| row[7] }

    subsets = [standard_zip_codes, typical_states, commissioned, with_area_codes]#, with_counties, with_time_zones]

    subsets.inject(CSV.read(csv_file)) { |rows, subset| rows.select(&subset) }.inject([]) do |locations, row|
      zip_code = row[0]
      state = row[5]
      county = row[6]
      time_zone = row[7]
      area_codes = row[8]
      latitude = row[9]
      longitude = row[10]
      country_code = row[12]

      area_codes.split(',').each do |area_code|
        locations << new(zip_code, state, area_code, county, country_code, latitude, longitude, time_zone)
      end

      locations

    end

  end

  def self.from_yaml(yaml_file=File.expand_path(File.join(File.dirname(__FILE__), 'locations.yaml')))
    #puts "Loading locations from #{yaml_file}"
    YAML::load(File.open(yaml_file))
  end

  def self.load(auto_yaml=true)
    begin
      from_yaml
    rescue Errno::ENOENT
      locations = from_csv
      save(locations) if auto_yaml
      locations
    end
  end

  def self.save(locations, yaml_file='locations.yaml')
    File.open(yaml_file, 'w' ) { |f| YAML.dump( locations, f ) }
  end


  private

  def idealized_time_zone
    offset = ((( latitude + 187.5 ) / 15).to_i - 12) * 3600
    ActiveSupport::TimeZone.all.find { |tz| tz.utc_offset == offset }
  end

end
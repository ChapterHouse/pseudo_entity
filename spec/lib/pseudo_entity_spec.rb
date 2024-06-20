require 'spec_helper'

describe PseudoEntity do

  let(:age) { 10 }
  let(:date) { age.years.ago }
  let(:cc_last_four) { '4321' }
  let(:latitude) { 1.2 }
  let(:longitude) { 3.4 }
  let(:street_position) { 'street_position' }
  let(:company_name) { 'Some Company Ltd.'}
  let(:city) { 'St. Archibald' }
  let(:state) { 'ZZ' }
  let(:zip_code) { 12345 }
  let(:first_name) { 'John' }
  let(:last_name) { 'Smith' }

  subject(:pseudo_entity) do
    PseudoEntity.new.tap{ |pe|
      allow(pe).to receive(:birth_day).and_return(date)
      allow(pe).to receive(:city).and_return(city)
      allow(pe).to receive(:state).and_return(state)
      allow(pe).to receive(:zip_code).and_return(zip_code)
      allow(pe).to receive(:credit_card_number).and_return('98765' + cc_last_four)
      allow(pe).to receive(:first_name).and_return(first_name)
      allow(pe).to receive(:last_name).and_return(last_name)
      allow(pe).to receive(:latitude).and_return(latitude)
      allow(pe).to receive(:longitude).and_return(longitude)
      allow(pe).to receive(:street_position).and_return(street_position)
      allow(pe).to receive(:company_name).and_return(company_name)
      allow(pe).to receive(:city).and_return(city)
    }
  end

  it "should calculate age" do
    expect(pseudo_entity.age).to eql(age)
  end

  it "should combine components into a full address" do
    expect(pseudo_entity).to receive(:street_address).and_return('street_address')
    expect(pseudo_entity.address).to eql("street_address\n#{city}, #{state}. #{zip_code}")
  end

  it "should identify when an address is and is not an apartment" do
    expect(pseudo_entity).to receive(:street_modifier_needed).and_return(:apartment)
    expect(pseudo_entity.apartment?).to be_truthy
    expect(pseudo_entity).to receive(:street_modifier_needed).and_return(:something_else)
    expect(pseudo_entity.apartment?).to be_falsey
  end

  it "should extract birth year" do
    expect(pseudo_entity.birth_year).to eql(date.year)
  end

  it "should extract the last four digits of the credit card number" do
    expect(pseudo_entity.credit_card_last_four).to eql(cc_last_four)
  end

  it "should combine names into a full name" do
    expect(pseudo_entity.full_name).to eql("#{first_name} #{last_name}")
  end

  it "should generate a google map url from latitude and longitude" do
    expect(pseudo_entity.google_map_url).to eql("https://maps.google.com/maps?q=loc:#{latitude},#{longitude}")
  end

  it "should not return new values without resetting" do
    pseudo_entity = PseudoEntity.new
    first_name = pseudo_entity.first_name
    expect(pseudo_entity.first_name).to equal(first_name)
  end

  it "should return new values after a reset" do
    pseudo_entity = PseudoEntity.new
    first_name = pseudo_entity.first_name
    last_name = pseudo_entity.last_name
    pseudo_entity.reset!
    expect(pseudo_entity.first_name).to_not eql(first_name)
    expect(pseudo_entity.last_name).to_not eql(last_name)
  end

  it "should return self after a reset" do
    expect(pseudo_entity.reset!).to equal(pseudo_entity)
  end

  it "should reset a single value" do
    pseudo_entity = PseudoEntity.new
    first_name = pseudo_entity.first_name
    last_name = pseudo_entity.last_name
    pseudo_entity.reset("first_name")
    expect(pseudo_entity.first_name).to_not eql(first_name)
    expect(pseudo_entity.last_name).to eql(last_name)
  end

  it "should return the new value after a reset of a single value" do
    pseudo_entity = PseudoEntity.new
    first_name_a = pseudo_entity.first_name
    first_name_b = pseudo_entity.reset("first_name")
    expect(first_name_a).to_not eql(first_name_b)
    expect(first_name_b).to eql(pseudo_entity.first_name)
  end

  it "should combine addresses in 2,1 order" do
    expect(pseudo_entity).to receive(:street_address_line_1).and_return(:street_address_line_1)
    expect(pseudo_entity).to receive(:street_address_line_2).and_return(:street_address_line_2)
    expect(pseudo_entity.street_address).to  eql('street_address_line_2 street_address_line_1')
  end

  it "should trim missing street information" do
    expect(pseudo_entity).to receive(:street_address_line_1).and_return(:street_address_line_1)
    expect(pseudo_entity).to receive(:street_address_line_2).and_return('')
    expect(pseudo_entity.street_address).to eql('street_address_line_1')
    expect(pseudo_entity).to receive(:street_address_line_1).and_return('')
    expect(pseudo_entity).to receive(:street_address_line_2).and_return(:street_address_line_2)
    expect(pseudo_entity.street_address).to eql('street_address_line_2')
  end

  it "should apartment number as street address line 1 when the address is at an apartment" do
    apartment_number = 1234
    expect(pseudo_entity).to receive(:apartment_number).and_return(apartment_number)
    expect(pseudo_entity).to receive(:apartment?).and_return(true)
    allow(pseudo_entity).to receive(:suite?).and_return(false)
    expect(pseudo_entity.street_address_line_1).to eql("APT #{apartment_number}")
  end

  it "should suite number as street address line 1 when the address is at a suite" do
    suite_number = 1234
    expect(pseudo_entity).to receive(:suite_number).and_return(suite_number)
    allow(pseudo_entity).to receive(:apartment?).and_return(false)
    expect(pseudo_entity).to receive(:suite?).and_return(true)
    expect(pseudo_entity.street_address_line_1).to eql("STE #{suite_number}")
  end

  it "should use the street position as street address line 1 when not at an apartment or suite" do
    expect(pseudo_entity).to receive(:apartment?).and_return(false)
    expect(pseudo_entity).to receive(:suite?).and_return(false)
    expect(pseudo_entity.street_address_line_1).to eql(street_position)
  end

  it "should use street position as street address line 2 when a street modifier is needed" do
    expect(pseudo_entity).to receive(:street_modifier_needed?).and_return(true)
    expect(pseudo_entity.street_address_line_2).to eql(street_position)
  end

  it "should return nil as street address line 2 when a street modifier is not needed" do
    expect(pseudo_entity).to receive(:street_modifier_needed?).and_return(false)
    expect(pseudo_entity.street_address_line_2).to be_nil
  end

  it "should identify when an address is and is not an suite" do
    expect(pseudo_entity).to receive(:street_modifier_needed).and_return(:suite)
    expect(pseudo_entity.suite?).to be_truthy
    expect(pseudo_entity).to receive(:street_modifier_needed).and_return(:something_else)
    expect(pseudo_entity.suite?).to be_falsey
  end

  it "should generate a yelp business id from the company name and the city" do
    expect(pseudo_entity.yelp_business_id).to eql('Some-Company-Ltd-St-Archibald')
  end

  it "should generate a yelp business url from the yelp business id" do
    expect(pseudo_entity).to receive(:yelp_business_id).and_return(:yelp_business_id)
    expect(pseudo_entity.yelp_business_url).to eq('http://www.yelp.com/biz/yelp_business_id')
  end

  it "should generate a string 22 characters long for yelp user id" do
    yelp_user_id = pseudo_entity.yelp_user_id
    expect(yelp_user_id).to be_an_instance_of(String)
    expect(yelp_user_id.size).to eql(22)
  end

end

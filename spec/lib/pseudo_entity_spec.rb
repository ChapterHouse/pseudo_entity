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
      pe.stub(:birth_day).and_return(date)
      pe.stub(:city).and_return(city)
      pe.stub(:state).and_return(state)
      pe.stub(:zip_code).and_return(zip_code)
      pe.stub(:credit_card_number).and_return('98765' + cc_last_four)
      pe.stub(:first_name).and_return(first_name)
      pe.stub(:last_name).and_return(last_name)
      pe.stub(:latitude).and_return(latitude)
      pe.stub(:longitude).and_return(longitude)
      pe.stub(:street_position).and_return(street_position)
      pe.stub(:company_name).and_return(company_name)
      pe.stub(:city).and_return(city)
    }
  end

  it "should calculate age" do
    pseudo_entity.age.should eql(age)
  end

  it "should combine components into a full address" do
    pseudo_entity.stub(:street_address).and_return('street_address')
    pseudo_entity.address.should eql("street_address\n#{city}, #{state}. #{zip_code}")
  end

  it "should identify when an address is and is not an apartment" do
    pseudo_entity.stub(:street_modifier_needed).and_return(:apartment)
    pseudo_entity.apartment?.should be_true
    pseudo_entity.stub(:street_modifier_needed).and_return(:something_else)
    pseudo_entity.apartment?.should be_false
  end

  it "should extract birth year" do
    pseudo_entity.birth_year.should eql(date.year)
  end

  it "should extract the last four digits of the credit card number" do
    pseudo_entity.credit_card_last_four.should eql(cc_last_four)
  end

  it "should combine names into a full name" do
    pseudo_entity.full_name.should eql("#{first_name} #{last_name}")
  end

  it "should generate a google map url from latitude and longitude" do
    pseudo_entity.google_map_url.should eql("https://maps.google.com/maps?q=loc:#{latitude},#{longitude}")
  end

  it "should not return new values without resetting" do
    pseudo_entity = PseudoEntity.new
    first_name = pseudo_entity.first_name
    pseudo_entity.first_name.should equal(first_name)
  end

  it "should return new values after a reset" do
    pseudo_entity = PseudoEntity.new
    first_name = pseudo_entity.first_name
    last_name = pseudo_entity.last_name
    pseudo_entity.reset!
    pseudo_entity.first_name.should_not eql(first_name)
    pseudo_entity.last_name.should_not eql(last_name)
  end

  it "should return self after a reset" do
    pseudo_entity.reset!.should equal(pseudo_entity)
  end

  it "should reset a single value" do
    pseudo_entity = PseudoEntity.new
    first_name = pseudo_entity.first_name
    last_name = pseudo_entity.last_name
    pseudo_entity.reset("first_name")
    pseudo_entity.first_name.should_not eql(first_name)
    pseudo_entity.last_name.should eql(last_name)
  end

  it "should return the new value after a reset of a single value" do
    pseudo_entity = PseudoEntity.new
    first_name_a = pseudo_entity.first_name
    first_name_b = pseudo_entity.reset("first_name")
    first_name_a.should_not eql(first_name_b)
    first_name_b.should eql(pseudo_entity.first_name)
  end

  it "should combine addresses in 2,1 order" do
    pseudo_entity.stub(:street_address_line_1).and_return(:street_address_line_1)
    pseudo_entity.stub(:street_address_line_2).and_return(:street_address_line_2)
    pseudo_entity.street_address.should  eql('street_address_line_2 street_address_line_1')
  end

  it "should trim missing street information" do
    pseudo_entity.stub(:street_address_line_1).and_return(:street_address_line_1)
    pseudo_entity.stub(:street_address_line_2).and_return('')
    pseudo_entity.street_address.should == 'street_address_line_1'
    pseudo_entity.stub(:street_address_line_1).and_return('')
    pseudo_entity.stub(:street_address_line_2).and_return(:street_address_line_2)
    pseudo_entity.street_address.should eql('street_address_line_2')
  end

  it "should apartment number as street address line 1 when the address is at an apartment" do
    apartment_number = 1234
    pseudo_entity.stub(:apartment_number).and_return(apartment_number)
    pseudo_entity.stub(:apartment?).and_return(true)
    pseudo_entity.stub(:suite?).and_return(false)
    pseudo_entity.street_address_line_1.should eql("APT #{apartment_number}")
  end

  it "should suite number as street address line 1 when the address is at a suite" do
    suite_number = 1234
    pseudo_entity.stub(:suite_number).and_return(suite_number)
    pseudo_entity.stub(:apartment?).and_return(false)
    pseudo_entity.stub(:suite?).and_return(true)
    pseudo_entity.street_address_line_1.should eql("STE #{suite_number}")
  end

  it "should use the street position as street address line 1 when not at an apartment or suite" do
    pseudo_entity.stub(:apartment?).and_return(false)
    pseudo_entity.stub(:suite?).and_return(false)
    pseudo_entity.street_address_line_1.should eql(street_position)
  end

  it "should use street position as street address line 2 when a street modifier is needed" do
    pseudo_entity.stub(:street_modifier_needed?).and_return(true)
    pseudo_entity.street_address_line_2.should eql(street_position)
  end

  it "should return nil as street address line 2 when a street modifier is not needed" do
    pseudo_entity.stub(:street_modifier_needed?).and_return(false)
    pseudo_entity.street_address_line_2.should be_nil
  end

  it "should identify when an address is and is not an suite" do
    pseudo_entity.stub(:street_modifier_needed).and_return(:suite)
    pseudo_entity.suite?.should be_true
    pseudo_entity.stub(:street_modifier_needed).and_return(:something_else)
    pseudo_entity.suite?.should be_false
  end

  it "should generate a yelp business id from the company name and the city" do
    pseudo_entity.yelp_business_id.should == 'Some-Company-Ltd-St-Archibald'
  end

  it "should generate a yelp business url from the yelp business id" do
    pseudo_entity.stub(:yelp_business_id).and_return(:yelp_business_id)
    pseudo_entity.yelp_business_url.should == 'http://www.yelp.com/biz/yelp_business_id'
  end

  it "should generate a string 22 characters long for yelp user id" do
    yelp_user_id = pseudo_entity.yelp_user_id
    yelp_user_id.should be_an_instance_of(String)
    yelp_user_id.size.should eql(22)
  end

end

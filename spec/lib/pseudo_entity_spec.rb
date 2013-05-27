require 'spec_helper'

describe PseudoEntity do
  it "should calculate age" do
    pseudo_entity = PseudoEntity.new
    pseudo_entity.stub(:birth_day) { 10.years.ago }
    pseudo_entity.age.should == 10
  end

  it "should combine components into a full address" do
    pseudo_entity = PseudoEntity.new
    pseudo_entity.stub(:street_address) { 'street_address' }
    pseudo_entity.stub(:city) { 'city' }
    pseudo_entity.stub(:state) { 'state' }
    pseudo_entity.stub(:zip_code) { 'zip_code' }
    pseudo_entity.address.should == "street_address\ncity, state. zip_code"
  end

  it "should identify when an address is and is not an apartment" do
    pseudo_entity = PseudoEntity.new
    pseudo_entity.stub(:street_modifier_needed) { :apartment }
    pseudo_entity.apartment?.should == true
    pseudo_entity.stub(:street_modifier_needed) { :something_else }
    pseudo_entity.apartment?.should_not == true
  end

  it "should extract birth year" do
    pseudo_entity = PseudoEntity.new
    date = 10.years.ago
    pseudo_entity.stub(:birth_day) { date }
    pseudo_entity.birth_year.should == date.year
  end

  it "should extract the last four digits of the credit card number" do
    last_four = "4321"
    pseudo_entity = PseudoEntity.new
    pseudo_entity.stub(:credit_card_number) { "98765" + last_four }
    pseudo_entity.credit_card_last_four.should == last_four
  end

  it "should combine names into a full name" do
    pseudo_entity = PseudoEntity.new
    pseudo_entity.stub(:first_name) { 'first' }
    pseudo_entity.stub(:last_name) { 'last' }
    pseudo_entity.full_name.should == 'first last'
  end

  it "should generate a google map url from latitude and longitude" do
    pseudo_entity = PseudoEntity.new
    latitude = 1.2
    longitude = 3.4
    pseudo_entity.stub(:latitude) { latitude }
    pseudo_entity.stub(:longitude) { longitude }
    pseudo_entity.google_map_url.should == "https://maps.google.com/maps?q=loc:#{latitude},#{longitude}"
  end

  it "should not return new values without resetting" do
    pseudo_entity = PseudoEntity.new
    names = [ 'alpha', 'bravo' ]
    pseudo_entity.stub(:random_first_name) { names.shift }
    pseudo_entity.first_name.should == pseudo_entity.first_name
  end

  it "should return new values after a reset" do
    pseudo_entity = PseudoEntity.new
    names = [ 'alpha', 'bravo' ]
    pseudo_entity.stub(:random_first_name) { names.shift }
    name = pseudo_entity.first_name
    pseudo_entity.reset!
    pseudo_entity.stub(:random_first_name) { names.shift }
    pseudo_entity.first_name.should_not == name
  end

  it "should return self after a reset" do
    pseudo_entity = PseudoEntity.new
    original = pseudo_entity
    pseudo_entity.reset!.should == original
  end

  it "should combine addresses in 2,1 order" do
    pseudo_entity = PseudoEntity.new
    pseudo_entity.stub(:street_address_line_1) { :street_address_line_1 }
    pseudo_entity.stub(:street_address_line_2) { :street_address_line_2 }
    pseudo_entity.street_address.should == 'street_address_line_2 street_address_line_1'
  end

  it "should trim missing street information" do
    pseudo_entity = PseudoEntity.new
    pseudo_entity.stub(:street_address_line_1) { :street_address_line_1 }
    pseudo_entity.stub(:street_address_line_2) { '' }
    pseudo_entity.street_address.should == 'street_address_line_1'
    pseudo_entity.stub(:street_address_line_1) { '' }
    pseudo_entity.stub(:street_address_line_2) { :street_address_line_2 }
    pseudo_entity.street_address.should == 'street_address_line_2'
  end

  it "should identify when an address is and is not an suite" do
    pseudo_entity = PseudoEntity.new
    pseudo_entity.stub(:street_modifier_needed) { :suite }
    pseudo_entity.suite?.should == true
    pseudo_entity.stub(:street_modifier_needed) { :something_else }
    pseudo_entity.suite?.should_not == true
  end

  it "should generate a yelp business id from the company name and the city" do
    pseudo_entity = PseudoEntity.new
    pseudo_entity.stub(:company_name) { "A B Co." }
    pseudo_entity.stub(:city) { "St. Louis" }
    pseudo_entity.yelp_business_id.should == "A-B-Co-St-Louis"
  end

  it "should generate a yelp business url from the yelp business id" do
    pseudo_entity = PseudoEntity.new
    pseudo_entity.stub(:yelp_business_id) { :yelp_business_id }
    pseudo_entity.yelp_business_url.should == 'http://www.yelp.com/biz/yelp_business_id'
  end

  it "should generate a string 22 characters long for yelp user id" do
    pseudo_entity = PseudoEntity.new
    pseudo_entity.yelp_user_id.class.should == String
    pseudo_entity.yelp_user_id.size.should == 22
  end

end

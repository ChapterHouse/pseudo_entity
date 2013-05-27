require 'spec_helper'

describe PseudoEntity do
  it "should calculate age" do
    pseudo_entity = PseudoEntity.new
    pseudo_entity.stub(:birth_day) { 10.years.ago }
    pseudo_entity.age.should == 10
  end

  it "should extract birth year" do
    pseudo_entity = PseudoEntity.new
    date = 10.years.ago
    pseudo_entity.stub(:birth_day) { date }
    pseudo_entity.birth_year.should == date.year
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

  it "should generate a string 22 characters long for yelp user id" do
    pseudo_entity = PseudoEntity.new
    pseudo_entity.yelp_user_id.class.should == String
    pseudo_entity.yelp_user_id.size.should == 22
  end

end

require 'spec_helper'

describe PseudoEntity::Randoms do

  RSpec::Matchers.define :be_all_digits do
    match do |string|
      string.gsub(/[0-9]*/,'').empty?
    end
  end

  RSpec::Matchers.define :be_all_alphabetic_characters do
    match do |string|
      string.gsub(/[a-z]|[A-Z]*/,'').empty?
    end
  end

  RSpec::Matchers.define :be_all_alphanumeric_characters do
    match do |string|
      string.gsub(/[a-z]|[A-Z][0-9]*/,'').empty?
    end
  end


  context "when included" do

    let(:class_a_regex) { /^10\.(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){2}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$/ }
    let(:class_b_regex) { /^172\.(?:(?:1[6-9]|2[0-9]|3[0-1]?)\.)(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.)(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$/ }
    let(:class_c_regex) { /^192\.168\.(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.)(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$/ }

    subject(:instance) do
      klass = Class.new
      klass.send(:include, PseudoEntity::Randoms)
      klass.new
    end

    it "responds to all RandomValues" do
      PseudoEntity::RandomValues.all? { |method| instance.respond_to?(method.to_sym) }.should be_true
    end

    it "lists all RandomValues as methods" do
      (PseudoEntity::RandomValues.map(&:to_s) - instance.methods.map(&:to_s)).should be_empty
    end

    it "responds to ArityValues" do
      methods = PseudoEntity::ArityValues.map { |regexp| regexp.to_s.match(/.*\^(.*_)\\d.*/)[1] + rand(100).to_s }
      methods.all? { |method| instance.respond_to?(method.to_sym) }.should be_true
    end

    it "responds to ArityRandoms" do
      methods = PseudoEntity::ArityRandoms.map { |regexp| regexp.to_s.match(/.*\^(.*_)\\d.*/)[1] + rand(100).to_s }
      methods.all? { |method| instance.respond_to?(method.to_sym, true) }.should be_true
    end

    it "has private ArityRandoms" do
      methods = PseudoEntity::ArityRandoms.map { |regexp| regexp.to_s.match(/.*\^(.*_)\\d.*/)[1] + rand(100).to_s }
      methods.all? { |method| !instance.respond_to?(method.to_sym) }.should be_true
    end

    it "has corresponding private random_X methods for RandomValues" do
      (PseudoEntity::RandomValues.map { |method| "random_#{method}".to_sym } - instance.private_methods.map(&:to_sym)).should be_empty
    end

    context "#parse_options" do

      it "sets initial values" do
        value_names = PseudoEntity::RandomValues
        hash = value_names.inject({}) { |hsh, name| hsh[name] = "123 #{name}"; hsh}
        instance.send(:parse_options, hash)
        value_names.all? { |name| instance.send(name) == "123 #{name}" }.should be_true
      end

    end

    context "#random_alpha" do

      it "returns X characters" do
        instance.send(:random_alpha, 256).size.should eql(256)
      end

      it "only generates alphabetic characters" do
        instance.stub(:rand).and_return(*(0..51).to_a)
        instance.send(:random_alpha, 256).should be_all_alphanumeric_characters
        # If only alphabetic characters are available then nothing should show up at slot 52
        instance.stub(:rand).and_return(52)
        instance.send(:random_alpha, 1).size.should eq(0)
      end

    end

    context "#random_alpha_numeric" do

      it "returns X characters" do
        instance.send(:random_alpha_numeric, 256).size.should eql(256)
      end

      it "only generates alphabetic characters or digits" do
        instance.stub(:rand).and_return(*(0..61).to_a)
        instance.send(:random_alpha, 256).should be_all_alphabetic_characters
        # If only alphabetic characters and digits are available then nothing should show up at slot 62
        instance.stub(:rand).and_return(62)
        instance.send(:random_alpha_numeric, 1).size.should eq(0)
      end

    end

    context "#random_apartment_number" do

      it "never returns zero or less" do
        instance.stub(:rand).and_return(0)
        instance.send(:random_apartment_number).should > 0
      end

    end

    context "#random_bank_account_number" do

      it "is thirteen characters long" do
        instance.send(:random_bank_account_number).size.should eql(13)
      end

      it "is all digits" do
        instance.send(:random_bank_account_number).should be_all_digits
      end

    end

    context "#random_bank_routing_number" do

      it "is nine characters long" do
        instance.send(:random_bank_routing_number).size.should eql(9)
      end

      it "is all digits" do
        instance.send(:random_bank_routing_number).should be_all_digits
      end

    end

    context "#random_numeric" do

      it "return X characters" do
        instance.send(:random_alpha_numeric, 256).size.should eql(256)
      end

      it "only generates digits" do
        instance.send(:random_numeric, 256).should be_all_digits
      end

    end

    context "#random_birth_day" do

      it "is always be at least 21 years ago" do
        instance.stub(:rand).and_return(0)
        (Date.today.year - instance.send(:random_birth_day).year).should >= 21
      end

    end

    context "#random_class_a_ip_address" do

      it "is in the private class A range" do
        instance.send(:random_class_a_ip_address).should =~ class_a_regex
      end

    end

    context "#random_class_b_ip_address" do

      it "is in the private class B range" do
        instance.send(:random_class_b_ip_address).should =~ class_b_regex
      end

    end

    context "#random_class_c_ip_address" do

      it "is in the private class C range" do
        instance.send(:random_class_c_ip_address).should =~ class_c_regex
      end

    end

    context "#random_email_address" do

      it "conforms to the pattern name@domain" do
        simple_email_regex = /^.*@.*\..*$/
        instance.send(:random_email_address) =~ simple_email_regex
      end

    end

    context "#random_facebook_id" do

      it "is all digits" do
        instance.send(:random_facebook_id).should be_all_digits
      end

      it "is a maximum of 64 bits long" do
        # This is a little brittle but not sure how else to test this
        instance.should_receive(:rand).with(2**64).and_return(2**64)
        instance.send(:random_facebook_id)
      end

    end

    context "#random_federal_tax_id" do

      it "is nine characters long" do
        instance.send(:random_federal_tax_id).size.should eql(9)
      end

      it "is all digits" do
        instance.send(:random_federal_tax_id).should be_all_digits
      end

    end

    context "#random_google_analytics_account_id" do
      it "conforms to Google's Analytic Account pattern" do
        instance.send(:random_google_analytics_account_id).should =~ /^UA-\d{7}-\d{2}$/
      end
    end

    context "#random_ip_address" do

      it "is one of the non routable IP addresses" do
        ip_address = instance.send(:random_ip_address)
        [class_a_regex, class_b_regex, class_c_regex].any? { |regexp| ip_address =~ regexp }.should be_true
      end

    end

    context "#random_phone_number" do

      it "is a ten digit comma separated value" do
        instance.send(:random_phone_number).should =~ /^[0-9]{3}-[0-9]{3}-[0-9]{4}$/
      end

    end

    context  "#random_property_number" do

      it "will never be less than 10" do
        instance.stub(:rand).and_return(0)
        instance.send(:random_property_number).should >= 10
      end

    end

    context "#random_sex" do

      it "will never be less than 10" do
        instance.stub(:rand).and_return(0)
        instance.send(:random_property_number).should >= 10
      end

    end

  end

  context "as itself" do

    subject(:random) { PseudoEntity::Randoms }

    it "should create a token smaller than 32 characters" do
      random.token(3).size.should eq(3)
    end

    it "should create a token larger than 32 characters" do
      random.token(128).size.should eq(128)
    end

  end

end

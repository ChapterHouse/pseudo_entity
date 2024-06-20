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
      expect(PseudoEntity::RandomValues.all? { |method| instance.respond_to?(method.to_sym) }).to be_truthy
    end

    it "lists all RandomValues as methods" do
      expect(PseudoEntity::RandomValues.map(&:to_s) - instance.methods.map(&:to_s)).to be_empty
    end

    it "responds to ArityValues" do
      methods = PseudoEntity::ArityValues.map { |regexp| regexp.to_s.match(/.*\^(.*_)\\d.*/)[1] + rand(100).to_s }
      expect(methods.all? { |method| instance.respond_to?(method.to_sym) }).to be_truthy
    end

    it "responds to ArityRandoms" do
      methods = PseudoEntity::ArityRandoms.map { |regexp| regexp.to_s.match(/.*\^(.*_)\\d.*/)[1] + rand(100).to_s }
      expect(methods.all? { |method| instance.respond_to?(method.to_sym, true) }).to be_truthy
    end

    it "has private ArityRandoms" do
      methods = PseudoEntity::ArityRandoms.map { |regexp| regexp.to_s.match(/.*\^(.*_)\\d.*/)[1] + rand(100).to_s }
      expect(methods.all? { |method| !instance.respond_to?(method.to_sym) }).to be_truthy
    end

    it "has corresponding private random_X methods for RandomValues" do
      expect(PseudoEntity::RandomValues.map { |method| "random_#{method}".to_sym } - instance.private_methods.map(&:to_sym)).to be_empty
    end

    context "#parse_options" do

      it "sets initial values" do
        value_names = PseudoEntity::RandomValues
        hash = value_names.inject({}) { |hsh, name| hsh[name] = "123 #{name}"; hsh}
        instance.send(:parse_options, hash)
        expect(value_names.all? { |name| instance.send(name) == "123 #{name}" }).to be_truthy
      end

    end

    context "#random_alpha" do

      it "returns X characters" do
        expect(instance.send(:random_alpha, 256).size).to eql(256)
      end

      it "only generates alphabetic characters" do
        i = -1
        expect(instance).to receive(:rand).exactly(512).times { i = i + 1 % 52 }
        expect(instance.send(:random_alpha, 512)).to be_all_alphanumeric_characters
        # If only alphabetic characters are available then nothing should show up at slot 52
        expect(instance).to receive(:rand).and_return(52)
        expect(instance.send(:random_alpha, 1).size).to eq(0)
      end

    end

    context "#random_alpha_numeric" do

      it "returns X characters" do
        expect(instance.send(:random_alpha_numeric, 256).size).to eql(256)
      end

      it "only generates alphabetic characters or digits" do
        i = -1
        expect(instance).to receive(:rand).exactly(256).times { i = i + 1 % 61 }
        expect(instance.send(:random_alpha, 256)).to be_all_alphabetic_characters
        # If only alphabetic characters and digits are available then nothing should show up at slot 62
        expect(instance).to receive(:rand).and_return(62)
        expect(instance.send(:random_alpha_numeric, 1).size).to eq(0)
      end

    end

    context "#random_apartment_number" do

      it "never returns zero or less" do
        expect(instance).to receive(:rand).and_return(0)
        expect(instance.send(:random_apartment_number) > 0).to be_truthy
      end

    end

    context "#random_bank_account_number" do

      it "is thirteen characters long" do
        expect(instance.send(:random_bank_account_number).size).to eql(13)
      end

      it "is all digits" do
        expect(instance.send(:random_bank_account_number)).to be_all_digits
      end

    end

    context "#random_bank_routing_number" do

      it "is nine characters long" do
        expect(instance.send(:random_bank_routing_number).size).to eql(9)
      end

      it "is all digits" do
        expect(instance.send(:random_bank_routing_number)).to be_all_digits
      end

    end

    context "#random_numeric" do

      it "return X characters" do
        expect(instance.send(:random_alpha_numeric, 256).size).to eql(256)
      end

      it "only generates digits" do
        expect(instance.send(:random_numeric, 256)).to be_all_digits
      end

    end

    context "#random_birth_day" do

      it "is always be at least 21 years ago" do
        expect(instance).to receive(:rand).and_return(0)
        expect((Date.today.year - instance.send(:random_birth_day).year) >= 21).to be_truthy
      end

    end

    context "#random_class_a_ip_address" do

      it "is in the private class A range" do
        expect(instance.send(:random_class_a_ip_address) =~ class_a_regex).to be_truthy
      end

    end

    context "#random_class_b_ip_address" do

      it "is in the private class B range" do
        expect(instance.send(:random_class_b_ip_address) =~ class_b_regex).to be_truthy
      end

    end

    context "#random_class_c_ip_address" do

      it "is in the private class C range" do
        expect(instance.send(:random_class_c_ip_address) =~ class_c_regex).to be_truthy
      end

    end

    context "#random_email_address" do

      it "conforms to the pattern name@domain" do
        simple_email_regex = /^.*@.*\..*$/
        expect(instance.send(:random_email_address) =~ simple_email_regex).to be_truthy
      end

    end

    context "#random_facebook_id" do

      it "is all digits" do
        expect(instance.send(:random_facebook_id)).to be_all_digits
      end

      it "is a maximum of 64 bits long" do
        # rspec chokes on the following, hence the block
        # expect(instance).to receive(:rand).with(2**64).and_return(2**64)
        expect(instance).to receive(:rand).once.and_wrap_original do |original_method, *args, &block|
          expect(args.first).to eql(2**64)
          2**64
        end

        instance.send(:random_facebook_id)
      end

    end

    context "#random_federal_tax_id" do

      it "is nine characters long" do
        expect(instance.send(:random_federal_tax_id).size).to eql(9)
      end

      it "is all digits" do
        expect(instance.send(:random_federal_tax_id)).to be_all_digits
      end

    end

    context "#random_google_analytics_account_id" do
      it "conforms to Google's Analytic Account pattern" do
        expect(instance.send(:random_google_analytics_account_id) =~ /^UA-\d{7}-\d{2}$/).to be_truthy
      end
    end

    context "#random_ip_address" do

      it "is one of the non routable IP addresses" do
        ip_address = instance.send(:random_ip_address)
        expect([class_a_regex, class_b_regex, class_c_regex].any? { |regexp| ip_address =~ regexp }).to be_truthy
      end

    end

    context "#random_phone_number" do

      it "is a ten digit comma separated value" do
        expect(instance.send(:random_phone_number) =~ /^[0-9]{3}-[0-9]{3}-[0-9]{4}$/).to be_truthy
      end

    end

    context  "#random_property_number" do

      it "will never be less than 10" do
        expect(instance).to receive(:rand).and_return(0)
        expect(instance.send(:random_property_number) >= 10).to be_truthy
      end

    end

    context "#random_sex" do

      it "will never be less than 10" do
        expect(instance).to receive(:rand).and_return(0)
        expect(instance.send(:random_property_number) >= 10).to be_truthy
      end

    end

    context "#rand_X" do

      it "generates a random number" do
        # rspec chokes on the following, hence the block
        # expect(Kernel).to receive(:rand).at_least(:once).with(10).and_call_original
        expect(Kernel).to receive(:rand).at_least(:once).and_wrap_original do |original_method, *args, &block|
          expect(args.first).to eql(10)
          original_method.call(*args, &block)
        end
        first = instance.rand_10
        second = instance.rand_10
        expect(first).to eql(second)
      end

    end

  end

  context "as itself" do

    subject(:random) { PseudoEntity::Randoms }

    it "creates a token smaller than 32 characters" do
      expect(random.token(3).size).to eq(3)
    end

    it "creates a token larger than 32 characters" do
      expect(random.token(128).size).to eq(128)
    end

  end

end

require 'spec_helper'
require 'jasmine/selenium_driver'

describe ::Jasmine::SeleniumDriver do
  before :each do
    described_class.stub(:use_sauce?).and_return(true)
  end

  describe '#initialize' do
    let(:address) { 'http://saucelabs.com' }
    let(:browser) { 'firefox' }

    subject do
      described_class.new(browser, address)
    end

    before :each do
      Sauce::Selenium2.should_receive(:new).with(hash_including(:browser => browser)).and_return(true)
    end

    its(:http_address) { should eq(address) }
    its(:driver) { should_not be_nil }
  end
end

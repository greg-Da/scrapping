require_relative '../lib/dark_trader.rb'

describe "method scrapping_crypto" do
    it "should be a array of hash" do
        expect(scrapping_crypto).to be_a Array

        scrapping_crypto.each do |hash|
            expect(hash).to be_a Hash
        end
    end
    it "should include BTC & ETH & USDT" do
        array = []
        scrapping_crypto.each do |hash|
            array << hash.keys
        end
        expect(array.flatten).to include('BTC')
        expect(array.flatten).to include('ETH')
        expect(array.flatten).to include('USDT')
    end

    it "should not include nil" do
        array_keys = []
        array_values = []
        scrapping_crypto.each do |hash|
            array_keys << hash.keys
            array_values << hash.values
        end
        expect(array_keys).not_to include('nil')
        expect(array_values).not_to include('nil')
    end

    it "should have at least 20 crypto" do
        expect(scrapping_crypto.length).to be >= 20
    end
end
require_relative '../lib/depute.rb'

describe "test method get_depute" do
    it "should be a array of hash" do
        expect(get_depute()).to be_a Array

        get_depute().each do |hash|
            expect(hash).to be_a Hash
        end
    end
    it "should include Vuilletet & Youssouffa & Rudigoz" do
        array = []
        get_depute().each do |hash|
            array << hash.values
        end
        expect(array.flatten).to include('Vuilletet')
        expect(array.flatten).to include('Youssouffa')
        expect(array.flatten).to include('Rudigoz')
    end

    it "should find the right mail" do
        expect(get_depute_email("/jean-felix-acquaviva")).to eq("Jean-Felix.Acquaviva@assemblee-nationale.fr")
        expect(get_depute_email("/mickael-bouloux")).to eq("mickael.bouloux@assemblee-nationale.fr")
        expect(get_depute_email("/marianne-maximi")).to eq("marianne.maximi@assemblee-nationale.fr")
      end

    it "should not include nil" do
        array_keys = []
        array_values = []
        get_depute().each do |hash|
            array_keys << hash.keys
            array_values << hash.values
        end
        expect(array_keys).not_to include('nil')
        expect(array_values).not_to include('nil')
    end

    it "should have at least 500 deputes" do
        expect(get_depute().length).to be > (500)
    end
end
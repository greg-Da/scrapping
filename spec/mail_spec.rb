require_relative '../lib/mail.rb'

describe "test method get_townhall_urls" do
    it "should be a array of hash" do
        expect(get_townhall_urls()).to be_a Array

        get_townhall_urls().each do |hash|
            expect(hash).to be_a Hash
        end
    end
    it "should include ABLEIGES & BOUFFEMONT & VIGNY" do
        array = []
        get_townhall_urls().each do |hash|
            array << hash.keys
        end
        expect(array.flatten).to include('ABLEIGES')
        expect(array.flatten).to include('BOUFFEMONT')
        expect(array.flatten).to include('VIGNY')
    end

    it "should find the right mail" do
        expect(get_townhall_email("95/arnouville-les-gonesse.html")).to eq("webmaster@villedarnouville.com")
        expect(get_townhall_email("95/bouqueval.html")).to eq("mairiebouqueval@wanadoo.fr")
        expect(get_townhall_email("95/le-bellay-en-vexin.html")).to eq("mairie.bellay@wanadoo.fr")
      end

    it "should not include nil" do
        array_keys = []
        array_values = []
        get_townhall_urls().each do |hash|
            array_keys << hash.keys
            array_values << hash.values
        end
        expect(array_keys).not_to include('nil')
        expect(array_values).not_to include('nil')
    end

    it "should have at least 185 crypto" do
        expect(get_townhall_urls().length).to eq(185)
    end
end
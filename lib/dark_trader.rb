require 'nokogiri'  
require 'open-uri'

def scrapping_crypto
    curr_name = []
    curr_price = []
    page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))   
    
    page.xpath('/html/body/div[1]/div[2]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr/td[3]/div').each do |link|
        curr_name << link.content
    end
    
    page.xpath('/html/body/div[1]/div[2]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr/td[5]/div/a/span').each do |link|
        curr_price << link.content
    end

    array = []
    curr_name.each do |name|
        array << {name => curr_price[curr_name.index(name)]}
    end
    return array
end

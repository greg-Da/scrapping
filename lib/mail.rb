require 'nokogiri'  
require 'open-uri'

def get_townhall_email(townhall_url)
    page = Nokogiri::HTML(URI.open("https://www.annuaire-des-mairies.com/#{townhall_url}"))
    
    mail = page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
end


def get_townhall_urls

    array = []

    page = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/val-d-oise.html"))
    
    page.css('a.lientxt').each do |link|
        array << {link.content => get_townhall_email(link['href'][1..-1])}
    end
    return  array
end
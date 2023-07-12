require 'nokogiri'  
require 'open-uri'

def get_townhall_email(townhall_url)
    mail = ''
    page = Nokogiri::HTML(URI.open("https://www.annuaire-des-mairies.com/#{townhall_url}"))
    
    page.css('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').each do |link|
        mail = link.content
    end
    return mail
end


def get_townhall_urls

    hash = []

    page = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/val-d-oise.html"))
    
    page.css('a.lientxt').each do |link|
        hash << {link.content => get_townhall_email(link['href'][1..-1])}
    end


    return hash

end

require 'nokogiri'  
require 'open-uri'

def get_depute 
    array = []
    page = Nokogiri::HTML(URI.open("https://www.nosdeputes.fr/deputes"))
    
    page.css('span.list_nom').each do |link|
        url = link.parent.parent['href']
        name = link.content.gsub(/[ \n]/, '').split(',')
        array << {"first_name" => name[1],  "last_name" => name[0],  "email" => get_depute_email(url)}
    end

    return array
end

def get_depute_email(url)
    email = ''
    page = Nokogiri::HTML(URI.open("https://www.nosdeputes.fr#{url}"))

    page.xpath('/html/body/div[1]/div[5]/div/div[3]/div[1]/ul[2]/li[1]/ul/li[1]/a').each do |link|
        email = link.content
    end

    return email
end

# Scrapper

## dark_trader.rb
Scrapper for https://coinmarketcap.com/all/views/all/, which get all displayed symbols and prices for the cryptocurrencies.
To test it use the command `rspec spec/dark_trader_spec.rb`

## mail.rb
Scrapper for http://annuaire-des-mairies.com/val-d-oise.html, which get all emails for every town displayed on the page.
The get_townhall_urls() method calls the get_townhall_email method() which get the url of a page of a town and scrap it and return the email.
Then the get_townhall_urls() return an array of hash with the name of the town as key and the email as value.
To test it use the command `rspec spec/mail_spec.rb`

## depute.rb
Scrapper for https://www.nosdeputes.fr/deputes, which get all emails for every depute displayed on the page.
The get_depute() method calls the get_depute_email method() which get the url of a page of a depute and scrap it and return the email.
Then the get_depute() return an array of hash with the first and last name of the depute and the email in a hash.
To test it use the command `rspec spec/depute_spec.rb`

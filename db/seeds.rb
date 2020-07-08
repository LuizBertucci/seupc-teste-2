require 'json'
require 'open-uri'
require 'httparty'
require 'vacuum'


 # Parseando arquivo local

 # response = File.read(Rails.public_path + 'response.txt')

 # response_file = eval(response)


 # response_ruby = JSON.parse(response)



# Lógica para limparmos o DB, enquanto testamos a seed
puts 'cleaning database'

Notebook.destroy_all

puts 'database cleanned'

#Lógica para fazer um request http manual para a api da amazon

request = Vacuum.new(marketplace: 'BR',
                     access_key: 'AKIAJDG2EY7UPZXAW4TA',
                     secret_key: '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',
                     partner_tag: 'seupc01-20')




response = request.search_items(keywords:'notebook', search_index:'Computers', resources:[
 "ItemInfo.ExternalIds", "ItemInfo.ProductInfo",
 "ItemInfo.Features", "ItemInfo.Title",
 "BrowseNodeInfo.WebsiteSalesRank","ItemInfo.ManufactureInfo",
 "ItemInfo.ByLineInfo", "Images.Primary.Medium",
 "Offers.Summaries.HighestPrice", "Offers.Summaries.LowestPrice"
])


# Parseando resposta da API.




response = response.to_h

puts response

File.open('db/temptest.json', 'wb') do |file|
  file.write(JSON.generate(response))
end






# #  Parseando meu temporary.json gerado pela api da Amazon

# filepath = 'db/temp.json'

# response = File.read(filepath)

# response_file = eval(response)

# puts response_file






# # lógica para ler o primeiro response file com 10 itens, gerando novos 10 itens para o nosso DB

# notebooks = response_file[:SearchResult][:Items]

# notebooks.each do |notebook|

#   Notebook.create!(
#     bar_code:notebook[:ItemInfo][:ExternalIds][:EANs][:DisplayValues][0],
#     full_price: notebook[:Offers][:Summaries][0][:HighestPrice][:DisplayAmount],
#     offer_price:notebook[:Offers][:Summaries][0][:LowestPrice][:DisplayAmount],
#     brand:notebook[:ItemInfo][:ByLineInfo][:Brand][:DisplayValue],
#     modelo:(notebook[:ItemInfo][:ManufactureInfo][:ItemPartNumber][:DisplayValue] if notebook[:ItemInfo][:ManufactureInfo][:ItemPartNumber]),
#     processor:( notebook[:ItemInfo][:ProductInfo][:Size] ? notebook[:ItemInfo][:ProductInfo][:Size][:DisplayValue] : notebook[:ItemInfo][:Title][:DisplayValue]),
#     color:(notebook[:ItemInfo][:ProductInfo][:Color][:DisplayValue] if notebook[:ItemInfo][:ProductInfo][:Color]),
#     screen:notebook[:ItemInfo][:Title][:DisplayValue],
#     weight:( notebook[:ItemInfo][:ProductInfo][:ItemDimensions][:Weight]? notebook[:ItemInfo][:ProductInfo][:ItemDimensions][:Weight][:DisplayValue] : notebook[:ItemInfo][:Features][:DisplayValues]), # Tá em libras
#     ram:notebook[:ItemInfo][:Title][:DisplayValue],
#     hd:notebook[:ItemInfo][:Features][:DisplayValues],
#     ssd:notebook[:ItemInfo][:Features][:DisplayValues],
#     placa_video:notebook[:ItemInfo][:Features][:DisplayValues],
#     keyboard:notebook[:ItemInfo][:Features][:DisplayValues],
#     amazon_sales_rank:notebook[:BrowseNodeInfo][:WebsiteSalesRank][:SalesRank],
#     guarantee:(notebook[:ItemInfo][:ManufactureInfo][:Warranty][:DisplayValue] if notebook[:ItemInfo][:ManufactureInfo][:Warranty])
#  )
#   puts '+ 1 notebook added to our DB'
# end
#  puts 'notebooks sucessfully added to your database'








#Código anterior para referência


 # all_notebooks = Notebook.new(
 #  bar_code: response_file[:SearchResult][:Items].each do |key|
 #    key[:ItemInfo][:ExternalIds][:EANs][:DisplayValues].first
 #  end,

 #  full_price: response_file[:SearchResult][:Items].each do |key|
 #    key[:Offers][:Summaries].each do |el|
 #      el[:HighestPrice][:DisplayAmount]
 #    end
 #  end,

 #  offer_price: response_file[:SearchResult][:Items].each do |key|
 #    key[:Offers][:Summaries].each do |el|
 #      el[:LowestPrice][:DisplayAmount]
 #    end
 #  end,

 #  brand: response_file[:SearchResult][:Items].each do |key|
 #    key[:ItemInfo][:ByLineInfo][:Brand][:DisplayValue]
 #  end,

 #  modelo: response_file[:SearchResult][:Items].each do |key|
 #    key[:ItemInfo][:ManufactureInfo][:ItemPartNumber][:DisplayValue]
 #  end,

 #  processor: response_file[:SearchResult][:Items].each do |key|
 #    key[:ItemInfo][:ProductInfo][:Size][:DisplayValue]
 #  end,

 #  color: response_file[:SearchResult][:Items].each do |key|
 #    key[:ItemInfo][:ProductInfo][:Color][:DisplayValue]
 #  end,

 #  screen: response_file[:SearchResult][:Items].each do |key|
 #    key[:ItemInfo][:Title][:DisplayValue]
 #  end,

 #  weight: response_file[:SearchResult][:Items].each do |key|
 #    key[:ItemInfo][:Features][:DisplayValues].each do |el|
 #      el
 #    end
 #  end,

 #  ram: response_file[:SearchResult][:Items].each do |key|
 #    key[:ItemInfo][:Title][:DisplayValue]
 #  end,

 #  hd: response_file[:SearchResult][:Items].each do |key|
 #    key[:ItemInfo][:Features][:DisplayValues].each do |el|
 #      el
 #    end
 #  end,

 #  ssd: response_file[:SearchResult][:Items].each do |key|
 #    key[:ItemInfo][:Features][:DisplayValues].each do |el|
 #      el
 #    end
 #  end,

 #  placa_video: response_file[:SearchResult][:Items].each do |key|
 #    key[:ItemInfo][:Features][:DisplayValues].each do |el|
 #      el
 #    end
 #  end,

 #  keyboard: response_file[:SearchResult][:Items].each do |key|
 #    key[:ItemInfo][:Features][:DisplayValues].each do |el|
 #      el
 #    end
 #  end,

 #  amazon_sales_rank: response_file[:SearchResult][:Items].each do |key|
 #    key[:BrowseNodeInfo][:WebsiteSalesRank][:SalesRank]
 #  end,

 #  guarantee: response_file[:SearchResult][:Items].each do |key|
 #    key[:ItemInfo][:ManufactureInfo][:Warranty][:DisplayValue]
 #  end
 #  )

require 'json'
require 'open-uri'
require 'httparty'
require 'vacuum'


# isso aqui é um hotfix pro cloudinary na hora de passar um stringIo, nao remova a linha 9 nem a linha 10.

OpenURI::Buffer.send :remove_const, 'StringMax' if OpenURI::Buffer.const_defined?('StringMax')
OpenURI::Buffer.const_set 'StringMax', 0



 # Parseando arquivo local

 # response = File.read(Rails.public_path + 'response.txt')

 # response_file = eval(response)


 # response_ruby = JSON.parse(response)



# Lógica para limparmos o DB, enquanto testamos a seed
puts 'cleaning database'

Notebook.destroy_all

puts 'database cleanned'

# # Lógica para fazer um request http manual para a api da amazon

# request = Vacuum.new(marketplace: 'BR',
#                      access_key: 'AKIAJDG2EY7UPZXAW4TA',
#                      secret_key: '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',
#                      partner_tag: 'seupc01-20')



# # Loop de 50 vezes para popular o DB, cada request só retornam 10 notebooks.
# i = 5
# while i < 11 do
#   sleep(5) # garantir que não vamos floodar os requests e ser bloqueado por algumas horas pela amazon.
#   response = request.search_items(keywords:'notebook', search_index:'Computers',
#   item_page: "#{i}".to_i, sort_by:'Price:LowToHigh', resources:[
#    "ItemInfo.ExternalIds", "ItemInfo.ProductInfo",
#    "ItemInfo.Features", "ItemInfo.Title",
#    "BrowseNodeInfo.WebsiteSalesRank","ItemInfo.ManufactureInfo",
#    "ItemInfo.ByLineInfo", "Images.Primary.Medium",
#    "Offers.Summaries.HighestPrice", "Offers.Summaries.LowestPrice"
#   ])


#   # Parseando resposta da API.




#   response = response.to_h

#   # puts response

#   File.open("db/temporaryfiles/temp_low_to_high_#{i}.json", 'wb') do |file|
#     file.write(JSON.generate(response))
#   end

#   puts "página #{i} gerada"
#   i += 1
# end





# Parseando meu temporary.json gerado pela api da Amazon
i = 1

while i < 11 do

  puts "lendo temp#{i}.json"

  filepath = "db/temporaryfiles/temp#{i}.json"

  response = File.read(filepath)

  response_file = eval(response)

  # lógica para ler o primeiro response file com 10 itens, gerando novos 10 itens para o nosso DB

  notebooks = response_file[:SearchResult][:Items]

  notebooks.each do |notebook|

    laptop = Notebook.create!(
      bar_code:(notebook[:ItemInfo][:ExternalIds][:EANs][:DisplayValues][0] if notebook[:ItemInfo][:ExternalIds]),
      full_price: notebook[:Offers][:Summaries][0][:HighestPrice][:DisplayAmount],
      offer_price:notebook[:Offers][:Summaries][0][:LowestPrice][:DisplayAmount],
      brand:notebook[:ItemInfo][:ByLineInfo][:Brand][:DisplayValue],
      modelo:(notebook[:ItemInfo][:ManufactureInfo][:ItemPartNumber][:DisplayValue] if notebook[:ItemInfo][:ManufactureInfo] && notebook[:ItemInfo][:ManufactureInfo][:ItemPartNumber]),
      processor:( notebook[:ItemInfo][:ProductInfo] && notebook[:ItemInfo][:ProductInfo][:Size] ? notebook[:ItemInfo][:ProductInfo][:Size][:DisplayValue] : notebook[:ItemInfo][:Title][:DisplayValue]),
      color:(notebook[:ItemInfo][:ProductInfo][:Color][:DisplayValue] if notebook[:ItemInfo][:ProductInfo] && notebook[:ItemInfo][:ProductInfo][:Color]),
      screen:notebook[:ItemInfo][:Title][:DisplayValue],
      weight:( notebook[:ItemInfo][:ProductInfo] && notebook[:ItemInfo][:ProductInfo][:ItemDimensions] && notebook[:ItemInfo][:ProductInfo][:ItemDimensions][:Weight]? notebook[:ItemInfo][:ProductInfo][:ItemDimensions][:Weight][:DisplayValue] : notebook[:ItemInfo][:Features][:DisplayValues] if notebook[:ItemInfo][:Features]), # Tá em libras
      ram:notebook[:ItemInfo][:Title][:DisplayValue],
      hd:(notebook[:ItemInfo][:Features][:DisplayValues] if notebook[:ItemInfo][:Features]),
      ssd:(notebook[:ItemInfo][:Features][:DisplayValues] if notebook[:ItemInfo][:Features]),
      placa_video:(notebook[:ItemInfo][:Features][:DisplayValues] if notebook[:ItemInfo][:Features]),
      keyboard:(notebook[:ItemInfo][:Features][:DisplayValues] if notebook[:ItemInfo][:Features]),
      amazon_sales_rank:(notebook[:BrowseNodeInfo][:WebsiteSalesRank][:SalesRank] if notebook[:BrowseNodeInfo]) ,
      guarantee:(notebook[:ItemInfo][:ManufactureInfo][:Warranty][:DisplayValue] if notebook[:ItemInfo][:ManufactureInfo] && notebook[:ItemInfo][:ManufactureInfo][:Warranty] )
   )

    # adicionando a foto a cada notebook
    file= open(notebook[:Images][:Primary][:Medium][:URL])
    laptop.photo.attach(io:file, filename: "randomavatar.jpg")




    puts '+ 1 notebook added to our DB'
  end
   puts 'notebooks sucessfully added to your database'

  i += 1
end
















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

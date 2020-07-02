require 'json'
require 'open-uri'
require 'byebug'
require 'httparty'

 # Notebook.destroy_all

response = File.read(Rails.public_path + 'response.txt')

response_file = eval(response)
# Depois precisaremos iterar sobre essas variaveis para popular o banco de dados
response_file[:SearchResult][:Items].each do |key|
  garantia << key[:ItemInfo][:ManufactureInfo][:Warranty][:DisplayValue]
end

  all_notebooks = Notebook.new(
  cod_barras: response_file[:SearchResult][:Items].each do |key|
    key[:ItemInfo][:ExternalIds][:EANs][:DisplayValues].first
  end,

  preco_cheio: response_file[:SearchResult][:Items].each do |key|
    key[:Offers][:Summaries].each do |el|
      el[:HighestPrice][:DisplayAmount]
    end
  end,

  preco_oferta: response_file[:SearchResult][:Items].each do |key|
    key[:Offers][:Summaries].each do |el|
      el[:LowestPrice][:DisplayAmount]
    end
  end,

  marca: response_file[:SearchResult][:Items].each do |key|
    key[:ItemInfo][:ByLineInfo][:Brand][:DisplayValue]
  end,

  modelo: response_file[:SearchResult][:Items].each do |key|
    key[:ItemInfo][:ManufactureInfo][:ItemPartNumber][:DisplayValue]
  end,

  processador: response_file[:SearchResult][:Items].each do |key|
    key[:ItemInfo][:ProductInfo][:Size][:DisplayValue]
  end,
  cor: response_file[:SearchResult][:Items].each do |key|
    key[:ItemInfo][:ProductInfo][:Color][:DisplayValue]
  end,

  tela: response_file[:SearchResult][:Items].each do |key|
    key[:ItemInfo][:Title][:DisplayValue]
  end,

  peso: response_file[:SearchResult][:Items].each do |key|
    key[:ItemInfo][:Features][:DisplayValues].each do |el|
      el
    end
  end,

  memoria_ram: response_file[:SearchResult][:Items].each do |key|
    key[:ItemInfo][:Title][:DisplayValue]
  end,

  hd: response_file[:SearchResult][:Items].each do |key|
    key[:ItemInfo][:Features][:DisplayValues].each do |el|
      el
    end
  end,

  ssd: response_file[:SearchResult][:Items].each do |key|
    key[:ItemInfo][:Features][:DisplayValues].each do |el|
      el
    end
  end,

  placa_video: response_file[:SearchResult][:Items].each do |key|
    key[:ItemInfo][:Features][:DisplayValues].each do |el|
      el
    end
  end,

  teclado: response_file[:SearchResult][:Items].each do |key|
    key[:ItemInfo][:Features][:DisplayValues].each do |el|
      el
    end
  end,

  amazon_sales_rank: response_file[:SearchResult][:Items].each do |key|
    key[:BrowseNodeInfo][:WebsiteSalesRank][:SalesRank]
  end,

  garantia: response_file[:SearchResult][:Items].each do |key|
    key[:ItemInfo][:ManufactureInfo][:Warranty][:DisplayValue]
  end
  )

 # all_notebooks.save
 # cod_barras = []
 # preco_cheio = []
 # preco_oferta = []
 # marca = []
 # modelo = []
 # processador = []
 # color = []
 # tela = []
 # peso = []
 # info_ram = []
 # hd = []
 # info_ssd = []
 # placa_video = []
 # teclado = []
 # sales_rank = []
 # garantia = []
 # all_notebooks = {}

# response_file[:SearchResult][:Items].each do |key|
#   barras << key[:ItemInfo][:ExternalIds][:EANs][:DisplayValues].first
# end

# response_file[:SearchResult][:Items].each do |key|
#   key[:Offers][:Summaries].each do |el|
#     preco_cheio << el[:HighestPrice][:DisplayAmount]
#   end
# end

# response_file[:SearchResult][:Items].each do |key|
#   key[:Offers][:Summaries].each do |el|
#     preco_oferta << el[:LowestPrice][:DisplayAmount]
#   end
# end

# response_file[:SearchResult][:Items].each do |key|
#   marca << key[:ItemInfo][:ByLineInfo][:Brand][:DisplayValue]
# end

# response_file[:SearchResult][:Items].each do |key|
#   modelo << key[:ItemInfo][:ManufactureInfo][:ItemPartNumber][:DisplayValue]
# end

# verificar
# response_file[:SearchResult][:Items].each do |key|
#   processador << key[:ItemInfo][:ProductInfo][:Size][:DisplayValue]
# end

# verificar
# response_file[:SearchResult][:Items].each do |key|
#   cor << key[:ItemInfo][:ProductInfo][:Color][:DisplayValue]
# end

# response_file[:SearchResult][:Items].each do |key|
#   tela << key[:ItemInfo][:Title][:DisplayValue]
# end

# response_file[:SearchResult][:Items].each do |key|
#   key[:ItemInfo][:Features][:DisplayValues].each do |el|
#     peso << el
#   end
# end

# response_file[:SearchResult][:Items].each do |key|
#   info_ram << key[:ItemInfo][:Title][:DisplayValue]
# end

# confirmar onde fica essa info
# response_file[:SearchResult][:Items].each do |key|
#   key[:ItemInfo][:Features][:DisplayValues].each do |el|
#     hd = el
#   end
# end

# filtrar melhor a informacao
# response_file[:SearchResult][:Items].each do |key|
#   key[:ItemInfo][:Features][:DisplayValues].each do |el|
#     info_ssd << el
#   end
# end

# filtrar melhor a informacao
# response_file[:SearchResult][:Items].each do |key|
#   key[:ItemInfo][:Features][:DisplayValues].each do |el|
#     placa_video << el
#   end
# end

# filtrar melhor a informacao
# response_file[:SearchResult][:Items].each do |key|
#   key[:ItemInfo][:Features][:DisplayValues].each do |el|
#     placa_video << el
#   end
# end

# filtrar melhor a informacao
# response_file[:SearchResult][:Items].each do |key|
#   key[:ItemInfo][:Features][:DisplayValues].each do |el|
#     teclado << el
#   end
# end

# response_file[:SearchResult][:Items].each do |key|
#   sales_rank << key[:BrowseNodeInfo][:WebsiteSalesRank][:SalesRank]
# end



# require 'net/http'
# require 'uri'
# require 'json'

# uri = URI.parse("https://webservices.amazon.com.br/paapi5/searchitems")
# request = Net::HTTP::Post.new(uri)
# request.content_type = "application/json; charset=UTF-8"
# request["Host"] = "webservices.amazon.com.br"
# request["Accept"] = "application/json, text/javascript"
# request["Accept-Language"] = "en-US"
# request["X-Amz-Date"] = "20200506T140152Z"
# request["X-Amz-Target"] = "com.amazon.paapi5.v1.ProductAdvertisingAPIv1.SearchItems"
# request["Content-Encoding"] = "amz-1.0"
# request["Authorization"] = "AWS4-HMAC-SHA256 Credential=AKIAJDG2EY7UPZXAW4TA/20200506/us-east-1/ProductAdvertisingAPI/aws4_request SignedHeaders=content-encoding;host;x-amz-date;x-amz-target  Signature=4d4a0fa74740582d456a5eb6b0552b3fb33c7ffb490433777650b1a3abb86870"
# request.body = JSON.dump({
#   "Keywords" => "notebook",
#   "Resources" => [
#     "BrowseNodeInfo.BrowseNodes",
#     "BrowseNodeInfo.BrowseNodes.Ancestor",
#     "BrowseNodeInfo.BrowseNodes.SalesRank",
#     "BrowseNodeInfo.WebsiteSalesRank",
#     "CustomerReviews.Count",
#     "CustomerReviews.StarRating",
#     "Images.Primary.Small",
#     "Images.Primary.Medium",
#     "Images.Primary.Large",
#     "Images.Variants.Small",
#     "Images.Variants.Medium",
#     "Images.Variants.Large",
#     "ItemInfo.ByLineInfo",
#     "ItemInfo.ContentInfo",
#     "ItemInfo.ContentRating",
#     "ItemInfo.Classifications",
#     "ItemInfo.ExternalIds",
#     "ItemInfo.Features",
#     "ItemInfo.ManufactureInfo",
#     "ItemInfo.ProductInfo",
#     "ItemInfo.TechnicalInfo",
#     "ItemInfo.Title",
#     "ItemInfo.TradeInInfo",
#     "Offers.Listings.Availability.MaxOrderQuantity",
#     "Offers.Listings.Availability.Message",
#     "Offers.Listings.Availability.MinOrderQuantity",
#     "Offers.Listings.Availability.Type",
#     "Offers.Listings.Condition",
#     "Offers.Listings.Condition.SubCondition",
#     "Offers.Listings.DeliveryInfo.IsAmazonFulfilled",
#     "Offers.Listings.DeliveryInfo.IsFreeShippingEligible",
#     "Offers.Listings.DeliveryInfo.IsPrimeEligible",
#     "Offers.Listings.DeliveryInfo.ShippingCharges",
#     "Offers.Listings.IsBuyBoxWinner",
#     "Offers.Listings.LoyaltyPoints.Points",
#     "Offers.Listings.MerchantInfo",
#     "Offers.Listings.Price",
#     "Offers.Listings.ProgramEligibility.IsPrimeExclusive",
#     "Offers.Listings.ProgramEligibility.IsPrimePantry",
#     "Offers.Listings.Promotions",
#     "Offers.Listings.SavingBasis",
#     "Offers.Summaries.HighestPrice",
#     "Offers.Summaries.LowestPrice",
#     "Offers.Summaries.OfferCount",
#     "ParentASIN",
#     "RentalOffers.Listings.Availability.MaxOrderQuantity",
#     "RentalOffers.Listings.Availability.Message",
#     "RentalOffers.Listings.Availability.MinOrderQuantity",
#     "RentalOffers.Listings.Availability.Type",
#     "RentalOffers.Listings.BasePrice",
#     "RentalOffers.Listings.Condition",
#     "RentalOffers.Listings.Condition.SubCondition",
#     "RentalOffers.Listings.DeliveryInfo.IsAmazonFulfilled",
#     "RentalOffers.Listings.DeliveryInfo.IsFreeShippingEligible",
#     "RentalOffers.Listings.DeliveryInfo.IsPrimeEligible",
#     "RentalOffers.Listings.DeliveryInfo.ShippingCharges",
#     "RentalOffers.Listings.MerchantInfo",
#     "SearchRefinements"
#   ],
#   "SearchIndex" => "Computers",
#   "PartnerTag" => "seupc01-20",
#   "PartnerType" => "Associates",
#   "Marketplace" => "www.amazon.com.br"
# })

# req_options = {
#   use_ssl: uri.scheme == "https",
# }

# response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
#   http.request(request)
# end

# response.code
# response.body

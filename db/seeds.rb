require 'json'
require 'open-uri'
require 'httparty'

 # Notebook.destroy_all

 response = File.read(Rails.public_path + 'response.txt')

 response_file = eval(response)

 all_notebooks = Notebook.new(
  bar_code: response_file[:SearchResult][:Items].each do |key|
    key[:ItemInfo][:ExternalIds][:EANs][:DisplayValues].first
  end,
  full_price: response_file[:SearchResult][:Items].each do |key|
    key[:Offers][:Summaries].each do |el|
      el[:HighestPrice][:DisplayAmount]
    end
  end,
  offer_price: response_file[:SearchResult][:Items].each do |key|
    key[:Offers][:Summaries].each do |el|
      el[:LowestPrice][:DisplayAmount]
    end
  end,
  brand: response_file[:SearchResult][:Items].each do |key|
    key[:ItemInfo][:ByLineInfo][:Brand][:DisplayValue]
end,
  modelo: response_file[:SearchResult][:Items].each do |key|
    key[:ItemInfo][:ManufactureInfo][:ItemPartNumber][:DisplayValue]
  end,
  processor: response_file[:SearchResult][:Items].each do |key|
    key[:ItemInfo][:ProductInfo][:Size][:DisplayValue]
  end,
  color: response_file[:SearchResult][:Items].each do |key|
    key[:ItemInfo][:ProductInfo][:Color][:DisplayValue]
end,
  screen: response_file[:SearchResult][:Items].each do |key|
    key[:ItemInfo][:Title][:DisplayValue]
  end,
  weight: response_file[:SearchResult][:Items].each do |key|
    key[:ItemInfo][:Features][:DisplayValues].each do |el|
      el
    end
  end,
  ram: response_file[:SearchResult][:Items].each do |key|
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
  keyboard: response_file[:SearchResult][:Items].each do |key|
    key[:ItemInfo][:Features][:DisplayValues].each do |el|
      el
    end
  end,
  amazon_sales_rank: response_file[:SearchResult][:Items].each do |key|
    key[:BrowseNodeInfo][:WebsiteSalesRank][:SalesRank]
  end,
  guarantee: response_file[:SearchResult][:Items].each do |key|
    key[:ItemInfo][:ManufactureInfo][:Warranty][:DisplayValue]
  end
  )


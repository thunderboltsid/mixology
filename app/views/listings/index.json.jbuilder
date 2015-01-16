json.array!(@listings) do |listing|
  json.extract! listing, :id, :name, :category, :description, :liqperc, :liqours, :mixers, :recipe
  json.url listing_url(listing, format: :json)
end

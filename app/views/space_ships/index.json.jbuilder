json.array!(@space_ships) do |space_ship|
  json.extract! space_ship, :id, :name
  json.url space_ship_url(space_ship, format: :json)
end

json.array!(@spaceships) do |spaceship|
  json.extract! spaceship, :id, :name
  json.url spaceship_url(spaceship, format: :json)
end

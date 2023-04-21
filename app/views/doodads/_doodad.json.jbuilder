json.extract! doodad, :id, :title, :url, :created_at, :updated_at
json.url doodad_url(doodad, format: :json)

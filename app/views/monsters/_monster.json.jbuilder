json.extract! monster, :id, :name, :hp, :mp, :version_id, :created_at, :updated_at
json.url monster_url(monster, format: :json)
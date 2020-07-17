json.extract! social_medium, :id, :site_name, :link, :image_name, :created_at, :updated_at
json.url social_medium_url(social_medium, format: :json)

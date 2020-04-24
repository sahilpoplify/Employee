json.extract! employee, :id, :name, :created_at, :updated_at, :image
json.url employee_url(employee, format: :json)

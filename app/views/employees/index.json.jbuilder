json.array!(@employees) do |employee|
  json.extract! employee, :id, :firstnam, :lastname, :add1, :add2, :add3, :role, :status, :admin, :user_id
  json.url employee_url(employee, format: :json)
end

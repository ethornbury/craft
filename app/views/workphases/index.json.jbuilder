json.array!(@workphases) do |workphase|
  json.extract! workphase, :id, :worknote, :total, :dateChanged, :product_id, :phase_id, :employee_id
  json.url workphase_url(workphase, format: :json)
end

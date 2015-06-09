json.array!(@phases) do |phase|
  json.extract! phase, :id, :phasename, :note
  json.url phase_url(phase, format: :json)
end

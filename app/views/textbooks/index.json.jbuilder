json.array!(@textbooks) do |textbook|
  json.extract! textbook, :id, :title, :price, :user_id
  json.url textbook_url(textbook, format: :json)
end

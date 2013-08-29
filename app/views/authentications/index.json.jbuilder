json.array!(@authentications) do |authentication|
  json.extract! authentication, :user_id, :provider, :uid
  json.url authentication_url(authentication, format: :json)
end

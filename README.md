# groceries_features_results

For posting and viewing results of
[groceries_features](https://github.com/cbrenner04/groceries_features)

## API use

```ruby
require 'rest-client'
require 'json'

response = RestClient.post(
  "#{ENV['URL']}/sign-in.json",
  user_login: { email: ENV['EMAIL'], password: ENV['PASSWORD'] }
)
auth_token = JSON.parse(response.body)['auth_token']
response = RestClient::Request.execute(
  method: :post,
  url: "#{ENV['URL']}/features.json",
  payload: {
    feature: {
      rspec_id: "./spec/features/invite_spec.rb[1:1]",
      description: "invites a user"
    }
  },
  headers: { 'Authorization' => "Token token=#{auth_token}" }
)
feature_id = JSON.parse(response.body)['feature_id']
response = RestClient::Request.execute(
  method: :post,
  url: "#{ENV['URL']}/results.json",
  payload: {
    result: {
      feature_id: feature_id,
      duration: 3.6548,
      exception: nil,
      passed: true,
      environment: 'development'
    }
  },
  headers: { 'Authorization' => "Token token=#{auth_token}" }
)
RestClient.delete(
  "#{ENV['URL']}/sign-out.json",
  { 'Authorization' => "Token token=#{auth_token}" }
)
```

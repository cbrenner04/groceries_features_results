# groceries_features_results

For posting and viewing results of
[groceries_features](https://github.com/cbrenner04/groceries_features)

## API use

```ruby
require 'rest-client'
require 'json'

response = RestClient.post(
  'http://localhost:3000/api/sign-in.json',
  user_login: { email: 'foo@ex.co', password: 'asdfasdf' }
)
auth_token = JSON.parse(response.body)['auth_token']
response = RestClient.get(
  'http://localhost:3000/api/home.json',
  { 'Authorization' => "Token token=#{auth_token}" }
)
response.body => 'Hello, World!'
RestClient.delete(
  'http://localhost:3000/api/sign-out.json',
  { 'Authorization' => "Token token=#{auth_token}" }
)
```

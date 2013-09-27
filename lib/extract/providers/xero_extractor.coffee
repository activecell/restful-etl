OAuth = require('oauth');
module.exports = (options = {}, cb) ->
  oauth = new OAuth.OAuth(
    "get_request_token url",
    "get_access_token url",
    options.oauth_consumer_key,
    options.oauth_consumer_secret,
    '1.0',
    'oob',
    'HMAC-SHA1',
    null,
    {"Accept": "application/json", "Connection" : "close", "User-Agent" : "Node authentication"}
  )

  oauth.getProtectedResource "https://api.xero.com/api.xro/2.0/#{options.extract.object}", "GET", options.oauth_access_key, options. oauth_access_secret,  (err, data, response) ->
    cb err, data if cb
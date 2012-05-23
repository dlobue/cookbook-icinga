
require 'digest/sha1'
require 'base64'

def sha_htpasswd(password)
  '{SHA}' + Base64.encode64(Digest::SHA1.digest(password)).strip
end


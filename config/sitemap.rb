# Host sitemap on S3
SitemapGenerator::Sitemap.adapter = SitemapGenerator::AwsSdkAdapter.new('s3_bucket',
  acl: 'public-read', # Optional. This is the default.
  cache_control: 'private, max-age=0, no-cache', # Optional. This is the default.
  access_key_id: 'AKIAI3SW5CRAZBL4WSTA',
  secret_access_key: 'asdfadsfdsafsadf',
  region: 'us-east-1',
  endpoint: 'https://sfo2.digitaloceanspaces.com'
)

# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://www.example.com"

# Add resources to sitemap
SitemapGenerator::Sitemap.create do
  add new_user_registration_path
  add new_user_session_path
  add privacy_path, changefreq: 'yearly'
  add terms_path, changefreq: 'yearly'
end

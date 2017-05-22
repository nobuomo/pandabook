# CarrierWave.configure do |config|
#   config.fog_credentials = {
#       provider:              'AWS',
#       aws_access_key_id:     ENV["AWS_ACCESS_KEY_ID"],
#       aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],
#       region:                'ap-northeast-1',
#       path_style:            true,
#   }
#
#   config.storage = :fog
#   config.fog_authenticated_url_expiration = 60
#   config.fog_public     = true
#   config.fog_attributes = {'Cache-Control' => 'public, max-age=86400'}
#   config.cache_storage = :fog
#
#   case Rails.env
#     when 'production'
#       config.fog_directory = 'panbook_production'
#       config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/panbook_production'
#     when 'development'
#       config.fog_directory = 'panbook_development'
#       config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/panbook_development'
#   end
# end

CarrierWave.configure do |config|
  config.root = Rails.root.join('tmp') # adding these...
  config.cache_dir = 'carrierwave' # ...two lines
  # config.cache_dir = "#{Rails.root}/tmp/uploads"

    config.fog_credentials = {
        provider:              'AWS',
        aws_access_key_id:     ENV["AWS_ACCESS_KEY_ID"],
        aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],
        region:                'ap-northeast-1',
        path_style:            true,
    }
  config.fog_directory     =  ENV['panbook-production']                             # required
  #config.fog_public     = false                                   # optional, defaults to true
  #config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
  #config.storage = :fog
  config.fog_authenticated_url_expiration = 60
  config.fog_public     = true
  config.fog_attributes = {'Cache-Control' => 'public, max-age=86400'}
  config.cache_storage = :fog

   case Rails.env
       when 'production'
         config.fog_directory = 'panbook-production'
         config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/panbook-production'
       when 'development'
         config.fog_directory = 'panbook-development'
         config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/panbook-development'
       end
end

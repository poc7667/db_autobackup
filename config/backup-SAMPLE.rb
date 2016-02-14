# encoding: utf-8
require 'dotenv'
Dotenv.load

Model.new( ENV['APP_NAME'], 'Description for dadasay') do
  ##
  # MongoDB [Database]
  #
  database MongoDB do |db|
    db.name               =  ENV['DB_NAME']
    db.host               = "localhost"
    db.port               = 27017
    db.additional_options = []
    db.lock               = false
  end

  ##
  # Local (Copy) [Storage]
  #
  store_with Local do |local|
    local.path       = ENV['DB_BACKUP_PATH']
    local.keep       = 5
  end

  ##
  # Gzip [Compressor]
  #
  compress_with Gzip
end
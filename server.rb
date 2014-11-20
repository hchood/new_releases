require 'sinatra'
require 'pry'
require 'csv'

def read_albums_from(csv)
  # return { "Fuego" => { artist: "" }, "Boy" => { artist: "U2" } }
  albums = {}

  CSV.foreach(csv, headers: true) do |row|
    albums[row["name"]] = row.to_hash
  end

  albums
end

get '/albums' do
  # create an @albums variable from the CSV
  @albums = read_albums_from('albums.csv')

  # find the index view & inserts the @albums variable into the view
  # we need to create the index view and render it

  erb :'albums/index'
end

get '/albums/:album_name' do
  albums = read_albums_from('albums.csv')
  @album = albums[params['album_name']]

  erb :'albums/show'
end






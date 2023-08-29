class PicturesController < ApplicationController
  def index
    @pictures = Picture.order('created_at desc')
    folder = Rails.root.join('public', 'images')
    @images = Dir.entries(folder)
  end
end

module BookmarkManager
  module Routes
    class Tags < Base

      get '/tags/:text' do
        tag = Tag.first(text: params[:text])
        @links = tag ? tag.links : []
        erb :index
      end

    end
  end
end
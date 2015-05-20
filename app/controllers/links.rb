module BookmarkManager
  module Routes
    class Links < Base

      get '/' do
      @links = Link.all
      erb :index
      end

      post '/links' do
        url = params['url']
        title = params['title']
        link = Link.create(url: url, title: title)
        tags = params['tags'].split(' ')
        tags.each do |tag|
          link.tags << Tag.first_or_create(text: tag)
          link.save
        end

        redirect to('/')
      end

      get '/links/new' do
        erb :"links/new"
      end

    end
  end
end
module BookmarkManager
  module Routes
    class Links < Base

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

    end
  end
end
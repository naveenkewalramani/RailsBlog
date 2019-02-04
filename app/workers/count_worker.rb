class CountWorker
  include Sidekiq::Worker
  sidekiq_options :queue => :count_queue
  def perform(author)
    @author_article = AuthorArticleCount.where(author_name: author).first
    if @author_article == nil
      @author_article = AuthorArticleCount.new
      @author_article.author_name = author
      @author_article.count = 1
      @author_article.save
    else
      @author_article.update(count: @author_article.count += 1)
    end
  end
end

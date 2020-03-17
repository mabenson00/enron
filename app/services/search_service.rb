class SearchService    
  def initialize(word)
      @word = word
      @logger ||= Logger.new("#{Rails.root}/log/search_words.log")
  end

  def search
    # see if search already exists
    search = Search.find_by(word: @word)
    return search.emails if search 
    @logger.info("searching for similars: #{search&.word}")

    # see if there are already search queries for words this string is a part of (eg: App/Apple)
    similars = find_similars 
    return similars if similars

    #full search if not found
    emails = find_new
      
    return "no results found"  unless emails
  end

  def find_similars
    similars = Search.where("word LIKE :prefix", prefix: "#{@word}%")
    similars = similars&.map{|s| s.emails.compact}
    @logger.info("found similars for #{@word}: #{similars&.map(&:word)}")
  end

  def find_new
    Email.where("word LIKE :prefix", prefix: "#{@word}%")
    #TODO: Create search record for future instances
    @logger.info("no similars found searching for new: #{@word}")
  end
end
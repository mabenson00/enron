class WordService    
  def initialize(email_record)
      @email_record = email_record
      @logger ||= Logger.new("#{Rails.root}/log/parse_words.log")
  end

  def parse_words

    #hackey fix for not having a subject or a body
    word_array = [@email_record.body&.split(" ")]  + [@email_record.subject&.split(" ")]
    word_array.flatten.each do |word|
      get_search(word)
    end
  end

  def get_search(word)
    search = Search.find_by(word: word)
    if search 
      add_email(search)
      @logger.info("found search: #{search.word}")
    else 
      search = Search.create!(word: word, emails: [@email_record])
      @logger.info("created search: #{search.word}")
    end
  end

  def add_email(search)
    search.emails << @email_record
    search.save
  end
end
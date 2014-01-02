class SummarizeContentJob
  # include Resque::Plugins::Status
  @queue = :document_analysis

  def self.perform(document_id)
    puts "--- summarizing content of document"
    # note it's both the call to parsed content and summarize which are slow...
    begin
      document = Document.find_by_id(document_id)
      puts "--- got document: #{document.inspect}"
      content = document.parsed_content
      puts "--- has content! summarizing..."
      document.summary = content.summarize(sentences: 4).map{|s|s[:sentence]}.join(' ')
      puts "--- summary: #{document.summary}"
      document.save
      puts "--- went okay!"
    rescue => e
      puts e.message
      puts e.backtrace
    end
    puts "===== DONE"
  end
 end

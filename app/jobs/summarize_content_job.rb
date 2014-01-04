class SummarizeContentJob
  # include Resque::Plugins::Status
  @queue = Document

  def self.perform(document_id)
      document = Document.find(document_id)
      # puts "--- summarizing..."
      document.summary = document.parsed_content.summarize(sentences: 4).map{|s|s[:sentence]}.join(' ')
      # puts "--- summary: #{document.summary}"
      document.save
      # puts "--- went okay!"
  end
end

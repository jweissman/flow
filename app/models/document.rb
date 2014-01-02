require 'ots'

class Document < ActiveRecord::Base
  has_attached_file :source, :path => ':rails_root/public/documents:url'
  # validates_attachment :document, content_type: { content_type: "application/pdf" }

  def sentences
    @sentences ||= self.content.split('.').reject { |s| s.blank? }
  end

  def summarize
    if self.content.blank?
      self.errors.add :base, 'cannot summarize without content'
      return false
    end

    Rails.logger.info "=== kicking off summarize content job"
    # self.worker_id = SummarizeContentJob.create(:document_id => self.id)
    # Rails.logger.info "--- using worker id: #{self.worker_id}"
    Resque.enqueue SummarizeContentJob, self.id # :document_id => self.id
    
    true
  end

  def extract_content
    unless self.content.blank? 
      self.errors.add :base, 'cannot analyze with content present' 
      return false
    end

    Rails.logger.info "=== kicking off extract pdf content job"
    self.update_attribute :worker_id, ExtractPDFContentJob.create(:document_id => self.id)
    Rails.logger.info "--- using worker id: #{self.worker_id}"
    
    true
  end

  def worker_progress
    status = Resque::Plugins::Status::Hash.get(self.worker_id)
    status.nil? ? nil : status.pct_complete
    # if status && status.working?
    #   "(#{self.worker_id}) #{status.pct_complete}%"
    # else
    #   "(#{self.worker_id}) Not working"
    # end
  end

  def parsed_content
    @parsed_content ||= OTS.parse(self.content)
  end
end

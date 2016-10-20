class  DabService
  require 'logger'

  attr_reader :service_title

  def initialize service_title
    @service_title = service_title
  end

  def logger
    @logger ||= Logger.new "#{service_title}_dab_service_log.txt"
  end

  def send_onairnow(pid, text)
    self.logger.info "Sending on air now. Pid: #{pid} Text: #{text}"
  end

  def send_onairnext(pid, text)
    self.logger.info "Sending on air next. Pid: #{pid} Text: #{text}"
  end
end

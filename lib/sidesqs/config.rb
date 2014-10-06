module SideSQS
  def self.config
    @config ||= SideSQS::Configuration.new
  end

  def self.configure
    if block_given?
      yield config
    end
  end

  class Configuration
    attr_accessor :queue_name

    def initialize
      self.queue_name = "workers_#{Rails.env}"
    end
  end
end

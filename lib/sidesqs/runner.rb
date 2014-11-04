module SideSQS
  module Runner
    def self.run(options={})
      options[:wait_time_seconds] ||= 60
      @queue ||= AWS::SQS.new.queues.create(SideSQS.config.queue_name)
      @queue.poll(options) do |message|
        data = JSON.parse(message.body)
        data['name'].constantize.new.perform(*data['args'])
      end
    end
  end
end

module SideSQS
  module Runner
    def self.run
      @queue ||= AWS::SQS.new.queues.create(SideSQS.config.queue_name)
      @queue.poll do |message|
        data = JSON.parse(message.body)
        data['name'].constantize.new.perform(*data['args'])
      end
    end
  end
end

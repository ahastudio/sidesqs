module SideSQS
  module Worker
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def perform_async(*args)
        @queue ||= AWS::SQS.new.queues.create(SideSQS.config.queue_name)
        @queue.send_message({
          name: self.to_s,
          args: args,
        }.to_json)
      end
    end
  end
end

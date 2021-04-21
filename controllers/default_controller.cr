module Rest
  module Controller
    class DefaultController < Shivneri::Controller
      @[DefaultWorker]
      def index
        text_result("Api ready")
      end
    end
  end
end
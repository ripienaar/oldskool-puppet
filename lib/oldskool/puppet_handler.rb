module Oldskool
  class PuppetHandler
    def initialize(params, keyword, config)
      @params = params
      @keyword = keyword
      @config = config
      self
    end

    def plugin_template(template)
      File.read(File.expand_path("../../../views/#{template}.erb", __FILE__))
    end

    def handle_request(keyword, query)
      type = Puppetdoc.new(query)

      {:template => plugin_template(:type), :type => type.doc}
    end
  end
end

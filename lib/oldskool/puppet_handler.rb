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

      menu = [{:title => "Type Reference", :url => "http://docs.puppetlabs.com/references/stable/type.html"},
              {:title => "Function Reference", :url => "http://docs.puppetlabs.com/references/stable/function.html"},
              {:title => "Language Guide", :url => "http://docs.puppetlabs.com/guides/language_guide.html"}]

      {:template => plugin_template(:type), :type => type.doc, :topmenu => menu}
    end
  end
end

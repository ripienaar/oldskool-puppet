require 'puppet'

module Oldskool
  class Puppetdoc
    attr_reader :type

    def initialize(type)
      loadall

      settype(type)
    end

    def loadall
      Puppet::Type.loadall unless Puppet::Type.constants.include?("File")
    end

    def settype(type)
      raise "Cannot find Puppet Type #{type}" unless Puppet::Type.const_defined?(type.capitalize)
      @type = Puppet::Type.const_get(type.capitalize)
    end

    def paramdoc(param)
      doc = {}

      if type.parameters.include?(param)
        doc[:markdown] = type.attrclass(param).doc
        doc[:type] = :param
      elsif type.validproperties.include?(param)
        doc[:markdown] = type.propertybyname(param).doc
        doc[:type] = :property
      elsif type.metaparams.include?(param)
        doc[:markdown] = type.attrclass(param).doc
        doc[:type] = :meta
      end

      if type.key_attributes.include?(param) and param != :name
        doc[:type] = :namevar
      end

      doc
    end

    def doc
      param_docs = {:name => type.name,
                    :description => type.doc,
                    :version => Puppet.version,
                    :params => {}, :metaparams => {}}

      type.parameters.each {|param| param_docs[:params][param] = paramdoc(param)}
      type.validproperties.each {|param| param_docs[:params][param] = paramdoc(param)}
      type.metaparams.each {|param| param_docs[:metaparams][param] = paramdoc(param)}

      param_docs
    end
  end
end

module Cfer::Cfn
  class Resource < Cfer::Block
    NON_PROXIED_METHODS = [:parameters, :options, :lookup_output]

    def initialize(name, type, **options, &block)
      @name = name

      self[:Type] = type
      self.merge!(options)
      self[:Properties] = HashWithIndifferentAccess.new
      build_from_block(&block)
    end

    def tag(k, v, **options)
      self[:Properties][:Tags] ||= []
      self[:Properties][:Tags].unshift({"Key" => k, "Value" => v}.merge(options))
    end

    def properties(**keyvals)
      self[:Properties].merge!(keyvals)
    end

    def respond_to?(method_sym)
      !NON_PROXIED_METHODS.include?(method_sym)
    end

    def method_missing(method_sym, *arguments, &block)
      key = camelize_property(method_sym)
      case arguments.size
      when 0
       raise "Expected a value when setting property #{key}"
      when 1
        properties key => arguments.first
      else
        properties key => arguments
      end
    end

    private
    def camelize_property(sym)
      sym.to_s.camelize.to_sym
    end
  end
end

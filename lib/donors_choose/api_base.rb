module DonorsChooseApi
  class ApiBaseModel

    # this is field behavior, it should be in it's own module/class
    def self.fields
      @fields ||= []
    end

    # keeps us in order (until 1.9.x)
    def self.field_keys
      @field_keys ||= {}
    end

    def self.field(key, options={}, &block)
      attr_accessor key
      define_method("#{key}=", &block) if block_given?

      self.field_keys[key] = options.fetch(:key, key.to_s)
      self.fields << key
    end

    # all this should be included
    def initialize(hash={})
      update_from_json(hash)
    end

    # currently, mostly overridden
    def update_from_json(hash={})
      unless hash.empty?
        self.class.fields.each do |field|
          key = self.class.field_keys[field]
          self.send("#{field}=".to_sym, hash[key])
        end
      end
    end

    def attributes
      values = self.class.fields.map { |attribute| self.send(attribute) }
      Hash[self.class.fields.zip(values)]
    end
  end
end

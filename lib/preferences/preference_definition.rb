module Preferences
  # Represents the definition of a preference for a particular model
  class PreferenceDefinition
    # The data type for the content stored in this preference type
    attr_reader :type, :name

    def initialize(name, *args)
      options = args.extract_options!
      options.assert_valid_keys(:default, :group_defaults)

      @type = args.first ? args.first.to_sym : :boolean

      @klass = if type == :any
        ActiveRecord::Type::Value.new
      else
        ActiveRecord::Type.lookup(type)
      end

      @name = name.to_s
      @default = options[:default]

      @group_defaults = (options[:group_defaults] || {}).each_with_object({}) do |(group, default), defaults|
        defaults[group.is_a?(Symbol) ? group.to_s : group] = type_cast(default)
      end
    end

    # The default value to use for the preference in case none have been
    # previously defined
    def default_value(group = nil)
      @group_defaults.include?(group) ? @group_defaults[group] : type_cast(@default)
    end

    # Determines whether column backing this preference stores numeric values
    def number?
      type == :integer || type == :float
    end

    # Typecasts the value based on the type of preference that was defined.
    def type_cast(value)
      return 1 if @type == :integer && value == true
      return 0 if @type == :integer && value == false

      @klass.deserialize(value)
    end

    # Typecasts the value to true/false depending on the type of preference
    def query(value)
      if !(value = type_cast(value))
        false
      elsif number?
        !value.zero?
      else
        !value.blank?
      end
    end
  end
end

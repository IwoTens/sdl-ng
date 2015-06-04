class SDL::Base::Type
  def as_json(options = { })
    return identifier.to_s if (identifier && !options[:ignore_identifier])

    Hash[
      self.class.properties(true).each_with_object([]) do |property, output|
        property_name = property.name
        property_value = get_sdl_value(property)

        next if property_value.nil? || (property_value.kind_of?(Array) && property_value.count == 0)

        if property.simple_type?
          output << [property_name, property_value.value.as_json]
        else
          output << [property_name, property_value.as_json]
        end
      end
    ]
  end
end

class SDL::Base::Type::Service
  def as_json(options = { })
    super(ignore_identifier: true)
  end
end

class Money
  def as_json(options = {})
    to_s
  end
end

module URI
  def as_json(options = {})
    to_s
  end
end
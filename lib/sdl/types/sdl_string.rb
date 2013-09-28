module SDL
  module Types
    class SDLString
      include SDLType

      default_type
      wraps String
      codes :string, :str
    end
  end
end
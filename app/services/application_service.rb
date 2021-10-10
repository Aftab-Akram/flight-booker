class ApplicationService
  # Initializes a new service with the given +attrs+.
  def initialize(attrs = {})
    attrs.each do |attr, value|
      public_send("#{attr}=", value)
    end if attrs
    super()
  end
end
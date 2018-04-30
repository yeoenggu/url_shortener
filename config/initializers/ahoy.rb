class Ahoy::Store < Ahoy::DatabaseStore
  def track_visit(data)
    data[:accept_language] = request.headers["Accept-Language"]
    super(data)
  end
end

# set to true for JavaScript tracking
Ahoy.api = false

# turn geocode for the moment.
Ahoy.geocode = true
class Peep

  include DataMapper::Resource
  belongs_to :user

  property :id, Serial

  property :message, Text
  property :timestamp, Time

  def self.sort_peeps
    all.reverse!
  end

end
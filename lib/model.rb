class Model
  def initialize(hash={})
    hash.keys.each do |key|
      self.send("#{key}=", hash[key])
    end
  end
end

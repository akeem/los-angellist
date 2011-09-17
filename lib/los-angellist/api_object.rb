class APIObject
  def initialize(params)
    params.each{|key, value|
      define_singleton_method(key.to_sym, Proc.new {value})
    }
  end
end

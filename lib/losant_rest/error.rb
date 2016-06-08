module LosantRest
  class ResponseError < StandardError
    attr_reader :code
    attr_reader :type

    def initialize(code, result)
      @code = code
      @type = result["type"]
      super(result["message"])
    end
  end
end

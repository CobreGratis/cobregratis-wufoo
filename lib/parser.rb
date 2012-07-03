class Parser
  def initialize(params = {})
    @params = params
    @attributes = {email: {}}
  end

  def bank_billet_attributes
    @params["FieldStructure"]["Fields"].each do |field|
      [:amount, :expire_at].each do |key|
        @attributes[key] = parse(@params[field["ID"]], key) if field["ClassNames"].match(key.to_s)
      end
      if field["ClassNames"].match('name')
        @attributes[:name] = @params[field["ID"]]
        @attributes[:email][:name] = @params[field["ID"]]
      end
      if field["ClassNames"].match('email')
        @attributes[:email][:address] = @params[field["ID"]]
      end
      if field["ClassNames"].match('address')
        field["SubFields"].each do |subfield|
          @attributes[:address] = @params[subfield["ID"]] if subfield["Label"] == 'Street Address'
          @attributes[:city] = @params[subfield["ID"]] if subfield["Label"] == 'City'
          @attributes[:state] = @params[subfield["ID"]] if subfield["Label"] == 'State / Province / Region'
          @attributes[:zipcode] = @params[subfield["ID"]] if subfield["Label"] == 'Postal / Zip Code'
        end
      end
    end
    @attributes
  end

  def cobregratis_token
    @params["HandshakeKey"]
  end

  def parse(value, type)
    case type
    when :amount
      value.to_f/100
    when :expire_at
      Date.strptime(value, '%Y%m%d')
    else
      value
    end
  end
end
module RestHelper
  def delete(url, parameters={})
    Rails.logger.debug "Making a REST DELETE request to '#{url}'."
    RestClient::Request.execute(method: :delete, url: url, payload: parameters, timeout: timeout)
  end

  def get(url, parameters={})
    Rails.logger.debug "Making a REST GET request to '#{url}'."
    RestClient::Request.execute(method: :get, url: url, headers: {params: parameters}, timeout: timeout)
  end

  def post(url, parameters={})
    Rails.logger.debug "Making a REST POST request to '#{url}'."
    RestClient::Request.execute(method: :post,
                                url: url,
                                payload: parameters.to_json,
                                headers: {"Accept" => "application/json",
                                          "Content-Type" => "application/json"},
                                timeout: timeout)
  end

  def put(url, parameters={})
    Rails.logger.debug "Making a REST PUT request to '#{url}'."
    RestClient::Request.execute(method: :put, url: url, payload: parameters, timeout: timeout)
  end

  def timeout
    ENV.fetch("HTTP_REQUEST_TIMEOUT", 60).to_i
  end
end

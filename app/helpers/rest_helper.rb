module RestHelper
  def delete(url, parameters={})
    Rails.logger.debug "Making a REST DELETE request to '#{url}'."
    RestClient::Request.execute(method: :delete, url: url)
  end

  def get(url, parameters={})
    Rails.logger.debug "Making a REST GET request to '#{url}'."
    RestClient::Request.execute(method: :get, url: url)
  end

  def post(url, parameters={})
    Rails.logger.debug "Making a REST POST request to '#{url}'."
    RestClient::Request.execute(method: :post, url: url)
  end

  def put(url, parameters={})
    Rails.logger.debug "Making a REST PUT request to '#{url}'."
    RestClient::Request.execute(method: :put, url: url)
  end
end

class PhoneActions

  def initialize(username, password)
    @actions_url = "https://#{username}:#{password}@api.<made_up>.com/actions/"
  end

  def call!(number, message)
    JSON.parse(RestClient.post("@actions_url/#{text}", {message: message, number: number}))
  end

  def text!(number, message)
    JSON.parse(RestClient.post("@actions_url/#{call}", {message: message, number: number}))
  end
end


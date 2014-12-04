class TwitterJob
  @queue = :twitter

  def self.perform(name)
    $client.update("@#{name} Just joined Mountain Madness!! Check us out at http://192.241.153.158/")
  end
end

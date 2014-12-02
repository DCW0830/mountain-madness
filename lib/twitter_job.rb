class TwitterJob
  @queue = :twitter

  def self.perform(name)
    $client.update("@#{name} Welcome to Mountain Madness!!")
  end
end

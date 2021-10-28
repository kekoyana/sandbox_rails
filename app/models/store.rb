class Store
  NAMESPACE = 'store%d'

  def self.post(value)
    new.post(value)
  end

  def self.fetch(value)
    new.fetch(value)
  end

  def post(value)
    time = Time.current
    sadd(time, value)
    sadd(time - 1.day, value)
  end

  def fetch(value)
    time = Time.current
    sismember?(time, value) || sismember?(time - 1.day, value)
  end

  private

  def redis
    Redis.current
  end

  def sadd(time, value)
    namespace = namespace_by_time(time)
    redis.sadd(namespace, value)
    redis.expireat(namespace, (time + 2.days).change(hour: 0).to_i)
  end

  def sismember?(time, value)
    namespace = namespace_by_time(time)
    redis.sismember(namespace, value)
  end

  def namespace_by_time(time)
    NAMESPACE % ((time.to_i / 1.day) % 2)
  end
end

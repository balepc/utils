class System
  def self.disk
    `df -h |tail -n1|awk '{ print $1}'`
  end
  def self.fullsize
    `df -h |tail -n1|awk '{ print $2}'`
  end
  def self.used
    `df -h |tail -n1|awk '{ print $3}'`
  end
  def self.avaliable
    `df -h |tail -n1|awk '{ print $4}'`
  end
  def self.use
    `df -h |tail -n1|awk '{ print $5}'`
  end
  def self.mounted
    `df -h |tail -n1|awk '{ print $6}'`
  end
end
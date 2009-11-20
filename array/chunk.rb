class Chunk

  attr_accessor :category
  attr_accessor :chunks
  

  def self.create(category)
    chunk = Chunk.new
    chunk.category = category
    chunk
  end
  
  def total
    return @c_total if @c_total
    @c_total = (children.size) + children.find_all{|c| c.children.size>0}.size + children.find_all{|c| c.spacing?}.size + children.sum{|c| c.children.size}
  end

  def piece
    return @c_piece if @c_piece
    @c_piece = (total / category.column_count)
  end

  def children
    category.children.counter_caches.with_children.to_a.sort_by{|x| [x.sort_field, x.name]}
  end

  def before_chunks
    self.chunks = []
    children.each do |child|
      add_to_chunk(nil, 1) if child.spacing?
      add_to_chunk(child, 1)
      chs = child.children.counter_caches.to_a
      chs.each do |child2|
        add_to_chunk(nil, 1) if child2.spacing?
        add_to_chunk(child2, 1)
        add_to_chunk(nil, 1) if chs.last?(child2)
      end
    end
    self.chunks
  end

  def add_to_chunk(category, add)    
    @index ||= 0
    @width ||= 0    

    @width += add
    self.chunks[@index] ||= []
    if category.nil? and self.chunks[@index].empty?

    else
      self.chunks[@index] << category
    end

    if @width >= piece
      @index += 1
      @width = 0
    end
  end

end
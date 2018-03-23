module ApplicationHelper
  def find_num(pos)
    @num= Position.find_by(:name=>pos.to_s.upcase).id
  end
end

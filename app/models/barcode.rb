class Barcode < ApplicationRecord
attr_accessor :xmlbarcode

  has_attached_file :xmlbarcode
  validates_attachment_content_type :xmlbarcode, content_type: "text/xml"
  before_save :parse_file

  private

  def parse_file
    @doc = Nokogiri::XML(xmlbarcode.queued_for_write[:original])
    self[:month] = take_from_xml("Segment", "http://russianpost.org", "NumMonth")[-2..-1].to_i
    self[:start] = take_from_xml("Segment", "http://russianpost.org", "NumBeg").to_i
    self[:end] = take_from_xml("Segment", "http://russianpost.org", "NumEnd").to_i
    self[:inn] = take_from_xml("Range", "http://russianpost.org", "Inn").to_i
    self[:index] = take_from_xml("Range", "http://russianpost.org", "IndexFrom").to_i
  end

  def take_from_xml(name, ns, keyword)
    result = @doc.xpath("//ns:#{name}", 'ns' => ns).first[keyword]
    unless is_integer? result
      self.errors.add(:base, "#{keyword} не является числом")
      raise ActiveRecord::Rollback
    end
    result
  end

  def is_integer?(a)
    a.to_i.to_s == a
  end

end

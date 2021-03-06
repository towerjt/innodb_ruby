class Innodb::Record
  attr_accessor :record

  def initialize(record)
    @record = record
  end

  def header
    record[:header]
  end

  def next
    record[:next]
  end

  def key
    record[:key]
  end

  def row
    record[:row]
  end

  def child_page_number
    record[:child_page_number]
  end

  def uncached_fields
    fields_hash = {}
    [:key, :row].each do |group|
      if record[group]
        record[group].each do |column|
          fields_hash[column[:name]] = column[:value]
        end
      end
    end
    fields_hash
  end

  def fields
    @fields ||= uncached_fields
  end
end

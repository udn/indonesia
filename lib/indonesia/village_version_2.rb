module Indonesia
  def self.villages_version_2(district_id = nil)
    @_villages ||= begin
      data = CSV.read('lib/data/village_version_2.csv')
      data.map { |r| { id: r[0].to_i, district_id: r[1].to_i, name: r[2] } }
    end

    if district_id.nil?
      @_villages
    else
      @_villages.select { |v| v[:district_id] == district_id.to_i }
    end
  end
end

# THIS WAS DONE FROM CONSOLE AND IS STRICTLY FOR REFERENCE

CSV.foreach("ma_town_list.csv", headers: true) do |row|
  if row["NAME"]
    town_name = row["NAME"].gsub(/ town?| city?| City?| Town?/, "")
    if !Town.find_by(name: town_name)
      Town.create(name: town_name)
    end
  end
end

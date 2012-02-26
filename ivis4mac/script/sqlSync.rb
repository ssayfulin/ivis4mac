
def exec(cmd)

  p = IO.popen(cmd)
  output = ""
  while (line = p.gets)
    puts line
    output = output + line;
  end
  return output
end

def dbImport(db)
  scriptDir = File.expand_path( File.dirname(__FILE__))

  dumpDir = File.expand_path("#{scriptDir}/../../database/dump")

  sql =  File.read("#{dumpDir}/poiskdetei.sql").gsub(/poiskdetei/, db)


  f = File.new("#{dumpDir}/ivis4mac_tmp.sql", "w")
  f.write(sql)
  f.close

  exec "mysql -u root --password=root < #{f.path}"
  #exec "rake db:schema:dump"
end


dbImport("ivis4mac_development")
dbImport("ivis4mac_test")
dbImport("ivis4mac_production")







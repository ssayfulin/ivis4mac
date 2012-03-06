
def exec(cmd)

  p = IO.popen(cmd)
  output = ""
  while (line = p.gets)
    puts line
    output = output + line;
  end
  return output

end

scriptDir = File.expand_path( File.dirname(__FILE__))



exec "mysql -u root --password=root < #{scriptDir}/dbClean.sql"
exec "ruby #{scriptDir}/dm.rb"



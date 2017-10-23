require 'rake/clean'
require 'zip'

namespace :book do
  desc 'prepare build'
  task :prebuild do
    Dir.mkdir 'build' unless Dir.exists? 'build'
  end

  desc 'build bem'
  task :bem => :prebuild do
    copyImages("./bem/images/*","build/images_bem/")
    puts "=== [BEM] Converting to HTML..."
    `bundle exec asciidoctor bem/bem.adoc --destination-dir=build`
    puts "=== HTML output at build/bem.html"

    puts "Converting to PDF... (this one takes a while)"
    `bundle exec asciidoctor bem/bem.adoc --destination-dir=build --backend=pdf --require=asciidoctor-pdf `
    puts "=== PDF output at build/bem.pdf "
  end

  desc 'build concurrency'
  task :concurrency => :prebuild do
    copyImages("./concurrency/images/*","build/images_concurrency/")
    puts "=== [CONCURRENCY]] Converting to HTML..."
    `bundle exec asciidoctor concurrency/concurrency.adoc --destination-dir=build`
    puts "=== HTML output at build/concurrency.html"

    puts "Converting to PDF... (this one takes a while)"
    `bundle exec asciidoctor concurrency/concurrency.adoc --destination-dir=build --backend=pdf --require=asciidoctor-pdf `
    puts "=== PDF output at build/concurrency.pdf"
  end

  desc 'build java-security'
  task :javasec => :prebuild do
    copyImages("./java-security/images/*","build/images_javasec")
    puts "=== [JAVA-SECURITY] Converting to HTML..."
    `bundle exec asciidoctor java-security/java-security.adoc --destination-dir=build`
    puts "=== HTML output at build/java-security.html"

    puts "Converting to PDF... (this one takes a while)"
    `bundle exec asciidoctor java-security/java-security.adoc --destination-dir=build --backend=pdf --require=asciidoctor-pdf `
    puts "=== PDF output at build/java-security.pdf "
  end

  desc 'build javaee'
  task :javaee => :prebuild do
    copyImages("./javaee/images/*","build/images_javaee/")
    puts "=== [JAVAEE] Converting to HTML..."
    `bundle exec asciidoctor javaee/javaee.adoc --destination-dir=build`
    puts "=== HTML output at targe/javaee.html"

    puts "Converting to PDF... (this one takes a while)"
    `bundle exec asciidoctor javaee/javaee.adoc --destination-dir=build --backend=pdf --require=asciidoctor-pdf `
    puts "=== PDF output at build/javaee.pdf "
  end

  desc 'build nodejs'
  task :nodejs => :prebuild do
    copyImages("./nodejs/images/*","build/images_nodejs/")
    puts "=== [NODEJS] Converting to HTML..."
    `bundle exec asciidoctor nodejs/nodejs.adoc --require=asciidoctor-diagram --destination-dir=build`
    puts "=== HTML output at build/nodejs.html"

    puts "Converting to PDF... (this one takes a while)"
    `bundle exec asciidoctor nodejs/nodejs.adoc  -r asciidoctor-diagram  --require=asciidoctor-pdf --backend=pdf --destination-dir=build`
    puts "=== PDF output at build/nodejs.pdf "
  end

  desc 'build pwapp'
  task :pwapp => :prebuild do
    copyImages("./pwapp/images/*","build/images_pwapp/")
    puts "=== [PWAPP] Converting to HTML..."
    `bundle exec asciidoctor pwapp/pwapp.adoc --destination-dir=build`
    puts "=== HTML output at build/pwapp.html"

    puts "Converting to PDF... (this one takes a while)"
    `bundle exec asciidoctor pwapp/pwapp.adoc --destination-dir=build --backend=pdf --require=asciidoctor-pdf `
    puts "=== PDF output at build/pwapp.pdf "
  end

  desc 'build struts2'
  task :struts2 => :prebuild do
    copyImages("./struts/images/*","build/images_strut2/")
    puts "=== [STRUTS2] Converting to HTML..."
    `bundle exec asciidoctor struts/struts2.adoc --destination-dir=build`
    puts "=== HTML output at build/struts2.html"

    puts "Converting to PDF... (this one takes a while)"
    `bundle exec asciidoctor struts/struts2.adoc --destination-dir=build --backend=pdf --require=asciidoctor-pdf `
    puts "=== PDF output at build/struts2.pdf "
  end

  desc 'build Broswer Optimization'
  task :bronet => :prebuild do
    copyImages("./bronet/images/*","build/images_bronet/")
    puts "=== [BROSWER NETWORKING] Converting to HTML..."
    `bundle exec asciidoctor bronet/bronet.adoc --destination-dir=build`
    puts "=== HTML output at build/bronet.html"

    puts "Converting to PDF... (this one takes a while)"
    `bundle exec asciidoctor bronet/bronet.adoc --destination-dir=build --backend=pdf --require=asciidoctor-pdf `
    puts "=== PDF output at build/bronet.pdf "
  end

  desc 'build all study notes'
  task :all  => %W[bem concurrency javasec javaee nodejs pwapp struts2 bronet] do
    puts "=== ALL DONE...! BYE...!"
  end

  def copyImages(in_dir,out_dir)
    Dir.mkdir out_dir unless Dir.exists? out_dir
    Dir.glob(in_dir).each do |image|
      FileUtils.copy(image,out_dir+File.basename(image))
    end
  end

  CLOBBER.include('build')
end

namespace :dist do
  desc 'prepare distribution'
  task :predist do
    Dir.mkdir 'dist' unless Dir.exists? 'dist'
  end

  desc 'dist angular Setup Bash Script'
  task :angular => :predist do
    zip_dir('angular2','dist/angular.zip')
  end

  desc 'dist jboss Setup Bash Script'
  task :jboss => :predist do
    zip_dir('jboss-domain','dist/jboss-domain.zip')
  end

  task :all => %W[angular jboss] do
    puts "=== ALL DONE..! Dist Complete!"
  end

  def zip_dir(in_dir,out_dir)
    entries = Dir.entries(in_dir) -%w(. ..)

    Zip::File.open(out_dir,Zip::File::CREATE) do |io|
      put_entries(entries, '', io, in_dir)
    end
  end

  def rec_zip_dir(disk_file_path,io,zip_path,in_dir)
    io.mkdir zip_path
    subdir = Dir.entries(disk_file_path) -%w(. ..)
    put_entries(subdir,zip_path,io,in_dir)
  end

  def put_entries(entries,path,io,in_dir)
    entries.each do |e|
      zip_path = path == '' ? e : File.join(path,e)
      disk_file_path = File.join(in_dir,zip_path)

      puts "[INFO] Deflating #{disk_file_path}"
      if File.directory? disk_file_path
        rec_zip_dir(disk_file_path,io,zip_path,in_dir)
      else
        put_into_zip(disk_file_path,io,zip_path)
      end
    end
  end

  def put_into_zip(disk_file_path,io,zip_path)
    io.get_output_stream(zip_path) do |f|
      f.write(File.open(disk_file_path,'rb').read)
    end
  end
  CLOBBER.include('dist')
end

task :default => "book:all"
task :zip => "dist:all"

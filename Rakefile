require 'rake/clean'
namespace :book do
  desc 'prepare build'
  task :prebuild do
    Dir.mkdir 'target' unless Dir.exists? 'target'
    Dir.mkdir 'target/images' unless Dir.exists? 'target/images'
  end

  desc 'build bem'
  task :bem => :prebuild do
    Dir.glob("./bem/images/*").each do |image|
      FileUtils.copy(image,"target/images/"+File.basename(image))
    end
    puts "=== [BEM] Converting to HTML..."
    `bundle exec asciidoctor bem/bem.adoc --destination-dir=target`
    puts "=== HTML output at target/bem.html"

    puts "Converting to PDF... (this one takes a while)"
    `bundle exec asciidoctor bem/bem.adoc --destination-dir=target --backend=pdf --require=asciidoctor-pdf `
    puts "=== PDF output at target/bem.pdf "
  end

  desc 'build concurrency'
  task :concurrency => :prebuild do
    Dir.glob("./concurrency/images/*").each do |image|
      FileUtils.copy(image,"target/images/"+File.basename(image))
    end
    puts "=== [CONCURRENCY]] Converting to HTML..."
    `bundle exec asciidoctor concurrency/concurrency.adoc --destination-dir=target`
    puts "=== HTML output at target/concurrency.html"

    puts "Converting to PDF... (this one takes a while)"
    `bundle exec asciidoctor concurrency/concurrency.adoc --destination-dir=target --backend=pdf --require=asciidoctor-pdf `
    puts "=== PDF output at target/concurrency.pdf"
  end

  desc 'build java-security'
  task :javasec => :prebuild do
    Dir.glob("./java-security/images/*").each do |image|
      FileUtils.copy(image,"target/images/"+File.basename(image))
    end
    puts "=== [JAVA-SECURITY] Converting to HTML..."
    `bundle exec asciidoctor java-security/java-security.adoc --destination-dir=target`
    puts "=== HTML output at target/java-security.html"

    puts "Converting to PDF... (this one takes a while)"
    `bundle exec asciidoctor java-security/java-security.adoc --destination-dir=target --backend=pdf --require=asciidoctor-pdf `
    puts "=== PDF output at target/java-security.pdf "
  end

  desc 'build javaee'
  task :javaee => :prebuild do
    Dir.glob("./javaee/images/*").each do |image|
      FileUtils.copy(image,"target/images/"+File.basename(image))
    end
    puts "=== [JAVAEE] Converting to HTML..."
    `bundle exec asciidoctor javaee/javaee.adoc --destination-dir=target`
    puts "=== HTML output at targe/javaee.html"

    puts "Converting to PDF... (this one takes a while)"
    `bundle exec asciidoctor javaee/javaee.adoc --destination-dir=target --backend=pdf --require=asciidoctor-pdf `
    puts "=== PDF output at target/javaee.pdf "
  end

  desc 'build nodejs'
  task :nodejs => :prebuild do
    Dir.glob("./nodejs/images/*").each do |image|
      FileUtils.copy(image,"target/images/"+File.basename(image))
    end
    puts "=== [NODEJS] Converting to HTML..."
    `bundle exec asciidoctor nodejs/nodejs.adoc --destination-dir=target`
    puts "=== HTML output at target/nodejs.html"

    puts "Converting to PDF... (this one takes a while)"
    `bundle exec asciidoctor nodejs/nodejs.adoc --destination-dir=target --backend=pdf --require=asciidoctor-pdf `
    puts "=== PDF output at target/nodejs.pdf "
  end

  desc 'build pwapp'
  task :pwapp => :prebuild do
    Dir.glob("./pwapp/images/*").each do |image|
      FileUtils.copy(image,"target/images/"+File.basename(image))
    end
    puts "=== [PWAPP] Converting to HTML..."
    `bundle exec asciidoctor pwapp/pwapp.adoc --destination-dir=target`
    puts "=== HTML output at target/pwapp.html"

    puts "Converting to PDF... (this one takes a while)"
    `bundle exec asciidoctor pwapp/pwapp.adoc --destination-dir=target --backend=pdf --require=asciidoctor-pdf `
    puts "=== PDF output at target/pwapp.pdf "
  end

  desc 'build struts2'
  task :struts2 => :prebuild do
    Dir.glob("./struts/images/*").each do |image|
      FileUtils.copy(image,"target/images/"+File.basename(image))
    end
    puts "=== [STRUTS2] Converting to HTML..."
    `bundle exec asciidoctor struts/struts2.adoc --destination-dir=target`
    puts "=== HTML output at target/pwapp.html"

    puts "Converting to PDF... (this one takes a while)"
    `bundle exec asciidoctor struts/struts2.adoc --destination-dir=target --backend=pdf --require=asciidoctor-pdf `
    puts "=== PDF output at target/struts2.pdf "
  end

  desc 'build all study notes'
  task :all  => %W[bem concurrency javasec javaee nodejs pwapp struts2] do
    puts "=== ALL DONE...! BYE...!"
  end
  CLOBBER.include('target')
end

task :default => "book:all"

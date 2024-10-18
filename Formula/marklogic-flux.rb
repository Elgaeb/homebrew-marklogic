class MarklogicFlux < Formula
    desc "Application for all of your data movement use cases with MarkLogic"
    homepage "https://marklogic.github.io/flux/"
    url "https://github.com/marklogic/flux/releases/download/1.1.2/marklogic-flux-1.1.2.zip"
    sha256 "dd2c891e64ef0f849b9ed63ce5f84c499bfb59c0e9322fc846ada4ffaa1f1ba8"
    license "Apache-2.0"
  
    depends_on "openjdk@11" => :optional
    depends_on "openjdk@17" => :optional
  
    def install

      inreplace "bin/flux" do |s|
        s.gsub!(/^CLASSPATH="(.*)"/, 'CLASSPATH="\1:$HOME/.flux/ext"')
      end

      bin.install "bin/flux"

      prefix.install_metafiles
      (prefix/"ext").install Dir["ext/*"]
      (prefix/"lib").install Dir["lib/*"]
      (prefix/"conf").install Dir["conf/*"]
    end
  end
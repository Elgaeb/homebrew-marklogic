class MarklogicFlux < Formula
    desc "Application for all of your data movement use cases with MarkLogic"
    homepage "https://marklogic.github.io/flux/"
    url "https://github.com/marklogic/flux/releases/download/1.1.1/marklogic-flux-1.1.1.zip"
    sha256 "11ee6fb25d8e692f9e01f494958247ad36a4498f3923be0f82f2b380e7e4cf7f"
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
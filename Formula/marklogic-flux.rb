class MarklogicFlux < Formula
    desc "Application for all of your data movement use cases with MarkLogic"
    homepage "https://marklogic.github.io/flux/"
    url "https://github.com/marklogic/flux/releases/download/1.1.3/marklogic-flux-1.1.3.zip"
    sha256 "ccdb0b59d189add7cacafb618b1c34b0f11a59489afbc2f17547e2f3c5ec2da3"
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
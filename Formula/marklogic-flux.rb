class MarklogicFlux < Formula
    desc "Application for all of your data movement use cases with MarkLogic"
    homepage "https://marklogic.github.io/flux/"
    url "https://github.com/marklogic/flux/releases/download/1.4.0/marklogic-flux-1.4.0.zip"
    sha256 "ae56b0bd018dda2b546243a69f7413102e76c8a85099c2ce1b691b6b66a9016a"
    license "Apache-2.0"
  
    depends_on "openjdk@11" => :optional
    depends_on "openjdk@17" => :optional

    # resource "embedding-model-azure-open-ai" do
    #   url "https://github.com/marklogic/flux/releases/download/1.4.0/flux-embedding-model-azure-open-ai-1.4.0-all.jar"
    #   sha256 "8abf539fefa9b82cdb5e16ea2700067989aca4c20ffb3c22fd2a0f4a3ae5945c"
    # end

    # resource "embedding-model-minilm" do
    #   url "https://github.com/marklogic/flux/releases/download/1.4.0/flux-embedding-model-minilm-1.4.0-all.jar"
    #   sha256 "0efd25bc2f5b98002165b568e7454fef277749749e2bfe279d45e11f670504dd"
    # end

    # resource "embedding-model-ollama" do
    #   url "https://github.com/marklogic/flux/releases/download/1.4.0/flux-embedding-model-ollama-1.4.0-all.jar"
    #   sha256 "50bf17c4fbad0649ec9db6d38ebfa197f00c7e32b044677722f581ae2fab8f52"
    # end

    def install

      inreplace "bin/flux" do |s|
        s.gsub!(/^CLASSPATH="(.*)"/, 'CLASSPATH="\1:$HOME/.flux/ext"')
      end

      bin.install "bin/flux"

      prefix.install_metafiles
      (prefix/"ext").install Dir["ext/*"]
      (prefix/"lib").install Dir["lib/*"]
      (prefix/"conf").install Dir["conf/*"]

      # resource("embedding-model-azure-open-ai").do { 
      #   (prefix/"ext").install
      # }

    end
  end

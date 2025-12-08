class MarklogicMlcp < Formula
    desc "The fastest way to import, export, and copy data to or from MarkLogic databases."
    homepage "https://developer.marklogic.com/products/mlcp/"
    url "https://developer.marklogic.com/download/binaries/mlcp/mlcp-12.0.1-bin.zip"
    sha256 "b62a565e831b2c6baca2a412ab6460546baab808193501383f314b6a478d17bb"
    license "Apache-2.0"
  
    depends_on "openjdk@11" => :optional
    depends_on "openjdk@17" => :optional

    def install
      
      dir_str = <<-END
        
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
    DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
    SOURCE="$(readlink "$SOURCE")"
    [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"/../

END

      inreplace "bin/mlcp.sh" do |s|
        s.gsub!(/^LIB_HOME=.*$/, 'LIB_HOME=$DIR/libexec')
        s.gsub!(/^DIR=.*$/, dir_str)
        s.gsub!(/^java -cp.*$/, 'java -cp "$CLASSPATH" -DCONTENTPUMP_HOME="$DIR/libexec/" -DBUNDLE_ARTIFACT=$BUNDLE_ARTIFACT $VMARGS $JVM_OPTS -Djava.library.path="$DIR/libexec/native" com.marklogic.contentpump.ContentPump "$@"')
      end
    
      bin.install "bin/mlcp.sh"

      prefix.install_metafiles
      libexec.install Dir["lib/*"]
      (prefix/"conf").install Dir["conf/*"]

    end
  end

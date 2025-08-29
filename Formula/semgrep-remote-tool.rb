class SemgrepRemoteTool < Formula
    desc "Automated Semgrep update and rules checking"
    homepage "https://github.com/ajbutt/"
    url "https://github.com/ajbutt/semgrep-remote-tool/releases/download/v12.19.7/semgrep-remote-tool-12.19.7.tar.gz"
    sha256 "ea4ffa053385a6ebc746d039f246f779a68e2d847efb0703168fb7c295c2a599"
    version "12.19.7"

    def install
        bin.install Dir["*"]
        Dir["#{bin}/*"].each do |f|
        system "codesign", "--force", "--sign", "-", f if File.file?(f)
        end
      end

    def caveats
        <<~EOS
        To finish installation, add the following line to .zshrc or .bashrc  
  source #{bin}/completion.sh
Then reopen your terminal app
        EOS
    end
    end

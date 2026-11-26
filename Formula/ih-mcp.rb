# Rendered by ih-infra scripts/brew_formula.py from config/ih-mcp-release.json; do not edit.
class IhMcp < Formula
  desc "Read-only MCP server for Infinite Haiku observability"
  homepage "https://infinitehaiku.com/docs/connect-ai-agent"
  # macOS (one universal archive); Linux overrides it per CPU below.
  url "https://infinitehaiku.com/download/ih-mcp/0.12.1/ih-mcp-macos-universal.tar.gz"
  sha256 "bef6fc2c5e161dfab52a124234d54afd2b89534230c87b8b012a9431238abf03"
  license :cannot_represent

  on_linux do
    on_intel do
      url "https://infinitehaiku.com/download/ih-mcp/0.12.1/ih-mcp-linux-x86_64.tar.gz"
      sha256 "30fab8d268864377798cf8b59a21ec412fadcc9fae9509c1ed571841925923e9"
    end
    on_arm do
      url "https://infinitehaiku.com/download/ih-mcp/0.12.1/ih-mcp-linux-arm64.tar.gz"
      sha256 "9ec11a6c10636a261d9db82b714ca252a59b163225d8b43dd32f35de3e21bba3"
    end
  end

  def install
    # The binary and its ih-release (the release it states) side by side in
    # libexec; bin holds only the link.
    libexec.install "ih-mcp"
    libexec.install "ih-release" if File.exist?("ih-release")
    bin.install_symlink libexec/"ih-mcp"
  end

  def caveats
    "Set up: ih-mcp login, then claude mcp add (see https://infinitehaiku.com/docs/connect-ai-agent)"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ih-mcp --version")
  end
end

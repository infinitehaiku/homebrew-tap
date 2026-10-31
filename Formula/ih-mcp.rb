# Rendered by ih-infra scripts/brew_formula.py from config/ih-mcp-release.json; do not edit.
class IhMcp < Formula
  desc "Read-only MCP server for Infinite Haiku observability"
  homepage "https://infinitehaiku.com/docs/connect-ai-agent"
  # macOS (one universal archive); Linux overrides it per CPU below.
  url "https://infinitehaiku.com/download/ih-mcp/0.4.0/ih-mcp-macos-universal.tar.gz"
  sha256 "6c05aec62e85c54c58ce8c1fcdfb74f804af5d07d8580f19b85e6206d3f15d88"
  license :cannot_represent

  on_linux do
    on_intel do
      url "https://infinitehaiku.com/download/ih-mcp/0.4.0/ih-mcp-linux-x86_64.tar.gz"
      sha256 "1de1bd9ff43b24af5fe5532ab107a0dcc54422f74913b691c279d991bf02af93"
    end
    on_arm do
      url "https://infinitehaiku.com/download/ih-mcp/0.4.0/ih-mcp-linux-arm64.tar.gz"
      sha256 "811e8be5b09eee7eed77f60803ede3654b2603e0292201efab8744282bd0f989"
    end
  end

  def install
    bin.install "ih-mcp"
  end

  def caveats
    "Set up: ih-mcp login, then claude mcp add (see https://infinitehaiku.com/docs/connect-ai-agent)"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ih-mcp --version")
  end
end

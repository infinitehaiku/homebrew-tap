# Rendered by ih-infra scripts/brew_formula.py from config/ih-mcp-release.json; do not edit.
class IhMcp < Formula
  desc "Read-only MCP server for Infinite Haiku observability"
  homepage "https://infinitehaiku.com/docs/connect-ai-agent"
  # macOS (one universal archive); Linux overrides it per CPU below.
  url "https://infinitehaiku.com/download/ih-mcp/0.7.0/ih-mcp-macos-universal.tar.gz"
  sha256 "c90260bd85c432e2a05cd635c041d136c1ed1201cdfdaf511f158c2f785906dd"
  license :cannot_represent

  on_linux do
    on_intel do
      url "https://infinitehaiku.com/download/ih-mcp/0.7.0/ih-mcp-linux-x86_64.tar.gz"
      sha256 "e7b1ff6a7fd7baa223e5278d200fc34b8349016dc30ad5dfe3089bc8c0447982"
    end
    on_arm do
      url "https://infinitehaiku.com/download/ih-mcp/0.7.0/ih-mcp-linux-arm64.tar.gz"
      sha256 "348e28ebf18614cf39a6a3a3ec67918e3bc15b61964a6dfcfb90946af1a839b2"
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

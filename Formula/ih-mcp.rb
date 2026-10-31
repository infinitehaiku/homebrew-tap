# Rendered by ih-infra scripts/brew_formula.py from config/ih-mcp-release.json; do not edit.
class IhMcp < Formula
  desc "Read-only MCP server for Infinite Haiku observability"
  homepage "https://infinitehaiku.com/docs/connect-ai-agent"
  # macOS (one universal archive); Linux overrides it per CPU below.
  url "https://infinitehaiku.com/download/ih-mcp/0.6.0/ih-mcp-macos-universal.tar.gz"
  sha256 "713616eda91c77cce7786b5db4e65a93b25a96eb4d41d4c7738f229f2e2f818f"
  license :cannot_represent

  on_linux do
    on_intel do
      url "https://infinitehaiku.com/download/ih-mcp/0.6.0/ih-mcp-linux-x86_64.tar.gz"
      sha256 "af13853fb6919e7e0bcc2645cf6fc42283b91753511ee6b56a7071d900681bf6"
    end
    on_arm do
      url "https://infinitehaiku.com/download/ih-mcp/0.6.0/ih-mcp-linux-arm64.tar.gz"
      sha256 "10d16697d8b6606b424a00f15aa778d7c57a919c178a0220e4febfedb571c23e"
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

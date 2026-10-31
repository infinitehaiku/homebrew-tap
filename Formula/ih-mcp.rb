# Rendered by ih-infra scripts/brew_formula.py from config/ih-mcp-release.json; do not edit.
class IhMcp < Formula
  desc "Read-only MCP server for Infinite Haiku observability"
  homepage "https://infinitehaiku.com/docs/connect-ai-agent"
  # macOS (one universal archive); Linux overrides it per CPU below.
  url "https://infinitehaiku.com/download/ih-mcp/0.5.0/ih-mcp-macos-universal.tar.gz"
  sha256 "876fcd19d4b186940751fd81c9cf8e13242902954a4d9e4d6f2aa70b7c21d420"
  license :cannot_represent

  on_linux do
    on_intel do
      url "https://infinitehaiku.com/download/ih-mcp/0.5.0/ih-mcp-linux-x86_64.tar.gz"
      sha256 "bb4aa799a2b8d2f82fa23413803a3619507ce5be0add472ac3263861ef521731"
    end
    on_arm do
      url "https://infinitehaiku.com/download/ih-mcp/0.5.0/ih-mcp-linux-arm64.tar.gz"
      sha256 "ab724f19b6b515e3d09e5c0a3fca570a0fd2a7cf99c42ecd35f2e2728268ecf0"
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

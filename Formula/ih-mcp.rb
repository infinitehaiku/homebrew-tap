# Rendered by ih-infra scripts/brew_formula.py from config/ih-mcp-release.json; do not edit.
class IhMcp < Formula
  desc "Read-only MCP server for Infinite Haiku observability"
  homepage "https://infinitehaiku.com/docs/connect-ai-agent"
  # macOS (one universal archive); Linux overrides it per CPU below.
  url "https://infinitehaiku.com/download/ih-mcp/0.12.0/ih-mcp-macos-universal.tar.gz"
  sha256 "c1e7d65b289cc8b25b31accde00ada54f6167e93b613288b237c84d7e2584eac"
  license :cannot_represent

  on_linux do
    on_intel do
      url "https://infinitehaiku.com/download/ih-mcp/0.12.0/ih-mcp-linux-x86_64.tar.gz"
      sha256 "1bb2e5e0d7533cf0c468d27e67cbb5d85db5ae9546c5804b24d7b10ecc5dc79f"
    end
    on_arm do
      url "https://infinitehaiku.com/download/ih-mcp/0.12.0/ih-mcp-linux-arm64.tar.gz"
      sha256 "dd3d599482838b93c9ea65b06a012855f6c090c62750e9edd3617ba9970b6ea8"
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

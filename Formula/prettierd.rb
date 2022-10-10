require "language/node"

class Prettierd < Formula
  desc "prettier, on SPEED!"
  homepage "https://github.com/fsouza/prettierd"
  url "https://registry.npmjs.org/@fsouza/prettierd/-/prettierd-0.22.3.tgz"
  sha256 "ee60003e15c76bcd0917abf7d6eff7e397a714f887a7e0ece86b551714004fce"
  license "ISC"
  head "https://github.com/fsouza/prettierd.git", branch: "main"

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/prettierd"]
  end

  test do
    output = pipe_output("#{bin}/prettierd test.js", "const arr = [1,2];", 0)
    assert_equal "const arr = [1, 2];", output.chomp
  end
end


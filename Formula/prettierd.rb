require "language/node"

class Prettierd < Formula
  desc "prettier, on SPEED!"
  homepage "https://github.com/fsouza/prettierd"
  url "https://registry.npmjs.org/@fsouza/prettierd/-/prettierd-0.24.0.tgz"
  sha256 "510593bd0f39157e1c2d00dcf59fa212a0ab3959fa1c5015ae0bd450dcdc430f"
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


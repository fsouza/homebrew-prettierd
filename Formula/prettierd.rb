require "language/node"

class Prettierd < Formula
  desc "prettier, on SPEED!"
  homepage "https://github.com/fsouza/prettierd"
  url "https://registry.npmjs.org/@fsouza/prettierd/-/prettierd-0.24.1.tgz"
  sha256 "5b3896c5b3a72a97c2bc28240f46940b52287b0c48487c841e30725a75b8e82c"
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


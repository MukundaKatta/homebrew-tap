class Bedrockcache < Formula
  include Language::Python::Virtualenv

  desc "Audit Anthropic prompt caching on AWS Bedrock through any abstraction stack"
  homepage "https://github.com/MukundaKatta/bedrockcache"
  url "https://files.pythonhosted.org/packages/source/b/bedrockcache/bedrockcache-0.1.0.tar.gz"
  sha256 "f5f7cbcecc7548e007bc93b834497c9952e543b5b28e8977a654c7faf7feefbe"
  license "MIT"
  head "https://github.com/MukundaKatta/bedrockcache.git", branch: "main"

  depends_on "python@3.12"

  def install
    virtualenv_install_with_resources
  end

  test do
    request_json = (testpath/"req.json")
    request_json.write <<~JSON
      {"model": "bedrock/anthropic.claude-sonnet-4-5-v1:0",
       "messages": [{"role": "user", "content": "hi"}]}
    JSON

    output = shell_output("#{bin}/bedrockcache audit #{request_json} --backend litellm", 0)
    assert_match "will_cache:        False", output
    assert_match "no `cache_control", output

    # --strict must exit non-zero when caching will not apply.
    shell_output("#{bin}/bedrockcache audit #{request_json} --backend litellm --strict", 1)
  end
end

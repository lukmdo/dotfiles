# import ...
import urllib
import urllib.parse
import pathlib



def define_env(env):
    "Hook function"

    @env.macro
    def repo_url_to(file_path):

        path = pathlib.Path("../" + file_path)
        assert path.exists(), f"filepath: {file_path!r} not found!"

        repo_baseurl = env.conf["repo_url"] + "/"

        return urllib.parse.urljoin(
          repo_baseurl,
          f"blob/master/{file_path}"
        )

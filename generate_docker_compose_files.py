from string import Template
import os
import sys
import re
from subprocess import Popen, PIPE, STDOUT

root_dir = os.path.dirname(os.path.realpath(__file__))


def create_docker_compose_file(tag_name):
    docker_config_dir = os.path.join(root_dir, "docker-config")
    docker_compose_template = os.path.join(docker_config_dir, "docker-compose-template.yml")
    docker_compose_yml = os.path.join(docker_config_dir, "docker-compose-generated.yml")
    dev_template = os.path.join(docker_config_dir, "dev-template.yml")
    dev_yml = os.path.join(docker_config_dir, "dev-generated.yml")

    write_compose_file(docker_compose_template, docker_compose_yml, tag_name)
    write_compose_file(dev_template, dev_yml, tag_name)


def write_compose_file(template_path, target_path, tag_name):
    with open(template_path) as template_stream:
        template = Template(template_stream.read())
        yml = template.substitute({'IMAGE_TAG': tag_name})
        with open(target_path, "w") as yml_stream:
            yml_stream.write(yml)
            print("Success: Created file '%s'" % target_path)


def execute_in_shell(command):
    p = Popen(command.split(), stdout=PIPE, stderr=STDOUT)
    if p.stdout:
        stdout = str(p.stdout.read(), "utf-8")
        return stdout
    else:
        return ""


def get_commit_hash():
    pattern = re.compile(r"commit\s+([\w\d]+)")
    output = execute_in_shell("git log -n1")
    results = pattern.findall(output)
    commit_hash = results[0] if results else ""
    return commit_hash


def get_git_tag_name():
    pattern = re.compile(r"[\w\d]+(\.[\w\d]+)")
    output = str(execute_in_shell("git describe --exact-match --tags")).strip()
    if pattern.match(output):
        return output
    else:
        return ""


def main():
    git_commit_hash = get_commit_hash()
    git_tag_name = get_git_tag_name()
    if git_commit_hash:
        if git_tag_name:
            print("docker-compose-generated: Creating Docker-Image-Tag: %s (Git-Tag)" % git_tag_name)
            create_docker_compose_file(":" + git_tag_name)
        else:
            print(
                "docker-compose-generated: Creating no Docker-Image-Tag aka 'latest' (No Git-Tag found for Hash: %s)" % git_commit_hash)
            create_docker_compose_file("")
    else:
        print("Aborted: Could not determine the latest git commit hash.")


if __name__ == "__main__":
    main()
